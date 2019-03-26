library(traitr)


### Name: aTableLayout
### Title: A container for tabular layout
### Aliases: aTableLayout

### ** Examples

## simple example
i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
lay <- aTableLayout("x","y", no_cols=2)
## Not run: i$make_gui(gui_layout=lay)



