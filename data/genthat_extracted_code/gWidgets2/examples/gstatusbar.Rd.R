library(gWidgets2)


### Name: gstatusbar
### Title: constructor to add a status bar to main window
### Aliases: .gstatusbar gstatusbar

### ** Examples

## Not run: 
##D w <- gwindow("Statusbar", visible=FALSE)
##D sb <- gstatusbar("status text", container=w)
##D g <- gvbox(container=w)
##D gbutton("update", container=g, handler=function(...) svalue(sb) <- "new value")
##D visible(w) <- TRUE
## End(Not run)



