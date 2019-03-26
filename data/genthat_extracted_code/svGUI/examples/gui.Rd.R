library(svGUI)


### Name: gui
### Title: A GUI object.
### Aliases: gui $.gui print.gui is.gui
### Keywords: misc

### ** Examples

# Create a GUI
gui_add("myGUI")
is.gui(myGUI)
myGUI
# Put an object in the GUI environment (fake button)
myGUI$button <- "my_button"
# Retrieve it
myGUI$button
# Get the curent status of the GUI
myGUI$status
# Eliminate this GUI and all its objects
gui_remove("myGUI")



