library(gWidgets2)


### Name: gstackwidget
### Title: Constructor for a stack of widgets
### Aliases: .gstackwidget gstackwidget

### ** Examples

## Not run: 
##D w <- gwindow("stack widget", visible=FALSE)
##D add_page <- function(cont, i) {
##D   g <- gvbox(container=cont)
##D   glabel(sprintf("page %s",i), container=g)
##D   bg <- ggroup(container=g); addSpring(bg)
##D   lb <- gbutton("Previous", container=bg, handler=function(h,...) {
##D     svalue(cont) <- max(1, i - 1)
##D   })
##D   rb <- gbutton("Next", container=bg, handler=function(h,...) {
##D     svalue(cont) <- min(i + 1, length(cont))
##D   })
##D }
##D sw <- gstackwidget(cont=w)
##D sapply(1:5, add_page, cont=sw)
##D visible(w) <- TRUE
## End(Not run)



