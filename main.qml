import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

ApplicationWindow {
    id: app
    visible: true
    visibility: "FullScreen"

    MouseArea {
        anchors.fill: parent

        onClicked: {
            popup.open();
        }
    }

    Popup {
        id: popup
        focus: true
        modal: true
        width: 250
        height: 250
        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose

        function hide() {
            contentItem.scale = 0.00;
            background.opacity = 0.00;
        }

        function show() {
            contentItem.scale = 1.00;
            background.opacity = 0.30;
        }

        onOpened: {
            show();
        }

        Overlay.modal: Item {

        }

        background: Rectangle {
            opacity: 0.00
            z: -1
            color: "#000000"

            anchors {
                fill: parent
                topMargin: parent.y * -1
                leftMargin: parent.x * -1
                bottomMargin: ( Screen.height - parent.height - parent.y ) * - 1
                rightMargin: ( Screen.width - parent.width - parent.x ) * - 1
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }
        }

        contentItem: Rectangle {
            anchors.fill: parent
            color: "red"
            scale: 0

            onScaleChanged: {
                if ( scale === 0.00 ) {
                    popup.close();
                }
            }

            Behavior on scale {
                NumberAnimation {
                    duration: 200
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    popup.hide();
                }
            }

        }
    }
}
