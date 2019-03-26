library(traitr)


### Name: aFrame
### Title: Box container with label and visual separator to indicate
###   grouping
### Aliases: aFrame

### ** Examples

i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
lay <- aFrame(label="label frame",
              aContainer("x","y"))
## Not run: i$make_gui(gui_layout=lay)



