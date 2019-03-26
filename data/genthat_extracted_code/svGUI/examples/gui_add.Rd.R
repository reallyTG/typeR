library(svGUI)


### Name: gui_add
### Title: Creation and management of GUI objects.
### Aliases: gui_add guiAdd gui_change guiChange gui_remove guiRemove
###   gui_list guiList gui_widgets guiWidgets gui_widgets<- guiWidgets<-
###   gui_ask guiAsk gui_ask<- guiAsk<-
### Keywords: misc

### ** Examples

# A 'gui' object named .GUI is automatically created in 'SciViews:TempEnv'
gui_list()

# Create a new GUI object to manage a separate GUI in the same R session
gui_add("myGUI")
gui_list()

# Change general properties of this GUI
gui_ask(myGUI) <- FALSE
# Add widgets to this GUI (you must provide methods for them)
# see the svDialogs package for examples
gui_widgets(myGUI) <- "tcltkWidgets"
gui_widgets(myGUI) # Added to existing ones if reset is FALSE

# Remove this new GUI
gui_remove("myGUI")



