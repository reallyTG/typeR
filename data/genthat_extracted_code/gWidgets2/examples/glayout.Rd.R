library(gWidgets2)


### Name: glayout
### Title: Constructor for grid layout container
### Aliases: .glayout [.GLayout [<-.GLayout glayout

### ** Examples

## Not run: 
##D 
##D w <- gwindow("glayout example", visible=FALSE)
##D g <- gvbox(container=w)
##D lyt <- glayout(container=g)
##D lyt[1,1] <- "a label"
##D lyt[1,2] <- gedit("A widget", container=lyt)
##D lyt[2, 1:2] <- gcombobox(state.name, cont=lyt)
##D g1 <- ggroup(container=g)
##D addSpring(g1)
##D gbutton("values", container=g1, handler=function(h, ...) {
##D   print(sapply(lyt[,2], svalue))
##D })
##D visible(w) <- TRUE
##D 
## End(Not run)



