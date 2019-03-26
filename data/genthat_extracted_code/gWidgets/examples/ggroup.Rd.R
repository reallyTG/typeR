library(gWidgets)


### Name: ggroup
### Title: Box containers for packing in subsequent widgets
### Aliases: ggroup gframe gexpandgroup
### Keywords: interface

### ** Examples

## Not run: 
##D   ## basic group 
##D   group <- ggroup(horizontal=FALSE, container=gwindow())
##D   l <- glabel("widget 1")  ## not in gWidgetstcltk -- needs a container
##D   add(group, l)
##D   glabel("widget 2", container = group) ## style for all toolkits
##D 
##D   ## nested groups
##D   group <- ggroup(horizontal=FALSE, container=gwindow())
##D   innergroup <- ggroup(container = group)
##D   gtext("Text area", container=group)
##D   gbutton("button 1", container = innergroup)
##D   gbutton("button 2", container = innergroup)
##D 
##D   ## expand argument
##D   group <- ggroup(horizontal=FALSE, container=gwindow())
##D   gbutton("no expand", container=group)
##D   gbutton("expand=TRUE", container=group, expand=TRUE)
##D 
##D   ## anchor argument
##D   w <- gwindow("Anchor")
##D   size(w) <- c(500,500)
##D   group <- ggroup(container=w)
##D   glabel("upper left", container=group, anchor=c(-1,1))
##D   glabel("lower right", container=group, anchor=c(1,-1))
##D 
##D   ## add spring
##D   group <- ggroup(container=gwindow("menubar-like example"))
##D   gbutton("File",handler=function(h,...) print("file"), container=group)
##D   gbutton("Edit",handler=function(h,...) print("edit"), container=group)
##D   addSpring(group)				   
##D   gbutton("Help",handler=function(h,...) print("help"), container=group)
##D 
##D 
##D   ## delete and add
##D   w <- gwindow("Delete and add", visible=FALSE)
##D   g <- ggroup(container=w)
##D   b <- gcheckbox("hide", checked=FALSE, container=g)
##D   l <- gedit("click checkbox to hide me", container=g)
##D   addHandlerClicked(b, handler=function(h,...) {
##D      if(svalue(b))
##D        delete(g, l)
##D      else
##D        add(g, l)
##D   })
##D   visible(w) <- TRUE
## End(Not run)



