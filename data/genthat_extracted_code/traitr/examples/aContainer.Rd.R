library(traitr)


### Name: aContainer
### Title: A container to give a different context than the default for a
###   set of items
### Aliases: aContainer

### ** Examples

i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
lay <- aContainer("x","y")
## Not run: i$make_gui(gui_layout=lay)
## how to do enabled when
lay <- aContainer("x",
         aContainer("y", enabled_when=function(.) .$get_x() > 1))
j <- i$instance()
## Not run: j$make_gui(gui_layout=lay)
## visible can be used to hide values if not needed
i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
lay <- aContainer("x","y")
## Not run: i$make_gui(gui_layout=lay)
## how to do enabled when
lay <- aContainer("x",
         aContainer("y", visible_when=function(.) .$get_x() > 1))
k <- i$instance()
## Not run: k$make_gui(gui_layout=lay)



