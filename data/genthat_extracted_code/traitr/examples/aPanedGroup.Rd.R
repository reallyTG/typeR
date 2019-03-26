library(traitr)


### Name: aPanedGroup
### Title: A two panel paned group container.
### Aliases: aPanedGroup

### ** Examples

## Not run: 
##D i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
##D lay <- aPanedGroup("x","y") ## just two children,
##D i$make_gui(gui_layout=lay)
##D ## can put other children into a container to make just two children for aPanedGroup instance
##D j <- aDialog(items=list(x=numericItem(1), y=stringItem("a"),
##D                         z=trueFalseItem(TRUE, label="check me")))
##D lay <- aPanedGroup("x", aContainer("y", "z"))
##D j$make_gui(gui_layout=lay)
## End(Not run)



