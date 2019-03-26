library(gWidgets2)


### Name: gseparator
### Title: constructor providing a widget for displaying a line in a GUI
### Aliases: .gseparator gseparator

### ** Examples

## Not run: 
##D 
##D w <- gwindow("Within page", visible=FALSE)
##D g <- gvbox(container=w)
##D glabel("Lorem ipsum ...", cont=g)
##D gseparator(cont=g)
##D bg <- ggroup(cont=g); addSpring(bg)
##D gbutton("dismiss", container=bg, handler=function(h,...) dispose(w))
##D visible(w) <- TRUE
##D 
##D w1 <- gwindow("within layout", visible=FALSE)
##D lyt <- glayout(container=w1)
##D lyt[1,1] <- "label"
##D lyt[2,1:2] <- gseparator(container=lyt)
##D lyt[3,2] <- "asdf"
##D visible(w1) <- TRUE
##D 
##D w2 <- gwindow("Within toolbar", visible=FALSE)
##D l <- list(file=gaction("File", parent=w2),
##D           sep=gseparator(parent=w2),
##D           quit=gaction("quit", parent=w2))
##D gtoolbar(l, cont=w2)
##D glabel("Lorem ipsum ...", container=w2)
##D visible(w2) <- TRUE
## End(Not run)



