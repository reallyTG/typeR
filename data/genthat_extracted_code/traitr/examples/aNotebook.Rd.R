library(traitr)


### Name: aNotebook
### Title: A notebook container.
### Aliases: aNotebook

### ** Examples

## Not run: 
##D i <- aDialog(items=list(x=numericItem(1), y=stringItem("a")))
##D lay <- aNotebook(
##D           aNotebookPage(label="page 1", "x"),
##D           aNotebookPage(label="page 2", "y")
##D         )
##D i$make_gui(gui_layout=lay)
## End(Not run)



