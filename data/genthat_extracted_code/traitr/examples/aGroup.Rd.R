library(traitr)


### Name: aGroup
### Title: A box container. Packs in items left to right or top to bottom
### Aliases: aGroup

### ** Examples

i <- aDialog(items=list(xlong=numericItem(1), y=stringItem("a")))
lay <- aGroup("xlongname","y", horizontal=FALSE)  # not in nice layout
## Not run: i$make_gui(gui_layout=lay)



