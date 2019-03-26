library(gWidgets2)


### Name: ggraphics
### Title: Constructor for an embeddable graphics device
### Aliases: .ggraphics ggraphics

### ** Examples

## Not run: 
##D ## This shows how to use the device within a notebook
##D 
##D w <- gwindow("notebook example")
##D nb <- gnotebook(cont=w)
##D 
##D devs <- lapply(1:5, function(i) ggraphics(cont=nb, label=as.character(i)))
##D 
##D addHandlerChanged(nb, handler=function(h,...) {
##D   ## Tricky part is svalue(h$obj) is not the new page number -- but old
##D   ## so we use the pageno component here
##D     gg <- h$obj[h$pageno]
##D     visible(gg) <- TRUE
##D })
##D 
##D 
## End(Not run)



