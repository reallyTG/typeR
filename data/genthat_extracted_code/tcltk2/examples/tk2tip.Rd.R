library(tcltk2)


### Name: tk2tip
### Title: Display and manage tooltips in Tk widgets
### Aliases: tk2tip tk2killtip tip tip.tk2widget tip<- tip<-.tk2widget
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ## Using plain Tcl/Tk label and button (tk2XXX equivalent have built-in
##D ## tooltip features)
##D tt <- tktoplevel()
##D lb <- tklabel(tt, text = "Move mouse over me, or over the button to see tooltip")
##D tkgrid(lb)
##D tk2tip(lb, "A tooltip for the label \ndisplayed on two lines")
##D but <- tkbutton(tt, text = "Exit", width = 10,
##D     command = function() tkdestroy(tt2))
##D tkgrid(but)
##D tk2tip(but, "Exit from this dialog box")
##D     
##D ## To test tk2killtip(), move mouse on top of a widget
##D ## so that the tip is visible, and force killing it manually using:
##D tk2killtip()
##D ## Move again to the widget: the tip is displayed again.
##D 
##D ## With tk2widgets, the tip() method can also be used:
##D lb2 <- tk2label(tt, text = "Move also over me to see the tooltip")
##D tkgrid(lb2)
##D tip(lb2) # No tip yet
##D tip(lb2) <- "Now the tooltip is there!"
##D ## Move the mouse over that last label
##D 
##D tip(lb2) # Yes, this is my tooltip
##D tip(lb2) <- NULL # To eliminate the toltip for this widget
## End(Not run)



