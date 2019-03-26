library(gWidgets2)


### Name: gformlayout
### Title: A form layout container
### Aliases: .gformlayout gformlayout svalue.GFormLayout

### ** Examples

## Not run: 
##D w <- gwindow("gformlayout", visible=FALSE)
##D g <- gvbox(container=w)
##D 
##D flyt <- gformlayout(container=g)
##D gedit("", label="Name:", container=flyt)
##D gedit("", label="Rank:", container=flyt)
##D gedit("", label="Serial No.:", container=flyt)
##D 
##D b <- gbutton("Show me", container=g, handler=function(h,...) {
##D print(svalue(flyt))
##D })
##D 
##D addSpring(g) ## better with Qt, else flyt expands to fill.
##D visible(w) <- TRUE
## End(Not run)



