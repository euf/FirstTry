/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Сменить регион")
                //                    onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height


        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.

        Column {
            id: column

            anchors.fill: parent
            spacing: Theme.paddingMedium


            PageHeader {
                title: qsTr("Расписание электричек")
                id: pageHeader
            }
            //            Label {
            //                x: Theme.paddingLarge
            //                text: qsTr("Hello Sailors")
            //                color: Theme.secondaryHighlightColor
            //                font.pixelSize: Theme.fontSizeExtraLarge
            //            }

            SectionHeader {
                id: cityName
                text: qsTr("Москва и область")
            }


            // ОТКУДА

            Row {
                spacing: Theme.paddingSmall
                width: parent.width

                SearchField {
                    id: searchFrom
                    placeholderText: qsTr("Откуда")
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width - locateFrom.width - Theme.horizontalPageMargin - parent.spacing
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: textArea.focus = true
                    //            validator: DoubleValidator {
                    //                bottom: -1
                    //                top: 10
                    //                decimals: 2
                    //            }
                    //            inputMethodHints: Qt.ImhFormattedNumbersOnly
                }

                IconButton{
                    id: locateFrom
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: whereFrom()
                    icon.source:
                        "image://theme/icon-m-whereami"
                }
            }

            // КУДА

            Row {
                spacing: Theme.paddingSmall
                width: parent.width

                SearchField {
                    id: searchTo
                    placeholderText: qsTr("Куда")
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width - locateFrom.width - Theme.horizontalPageMargin - parent.spacing
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: textArea.focus = true
                }

                IconButton{
                    id: locateTo
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: whereTo()
                    icon.source:
                        "image://theme/icon-m-whereami"
                }
            }

// ДАТА

            Button {
                id: button
                text: "Выберите дату"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var dialog = pageStack.push(pickerComponent, {
                                                    date: new Date('2016/07/28')
                                                })
                    dialog.accepted.connect(function() {
                        button.text = "Поезда на " + dialog.dateText
                    })
                }

                Component {
                    id: pickerComponent
                    DatePickerDialog {}
                }
            }





            //                //                TextField {
            //                //                    label: "Откуда"
            //                //                    placeholderText: label
            //                //                }
            //                TextField {
            //                    placeholderText: qsTr("Станция отправления")
            //                    label: qsTr("Откуда")
            //                    //                    width: parent.width - IconButton.width
            //                    //                    EnterKey.enabled: text.length > 0
            //                    //                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
            //                    //                    EnterKey.onClicked: textArea.focus = true
            //                }
            //                //                IconButton{
            //                //                    onClicked: doAction()
            //                //                    icon.source:
            //                //                        "image://theme/icon-m-whereami"
            //                //                }
            //        }
        }
    }
}


