library(traitr)


### Name: anExpandGroup
### Title: Expanding group. Has trigger to show/hide its children
### Aliases: anExpandGroup

### ** Examples

i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
lay <- anExpandGroup(label="label frame",
                    aContainer("x","y"))
## Not run: i$make_gui(gui_layout=lay)



