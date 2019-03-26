library(riverplot)


### Name: riverplot-styles
### Title: Riverplot styles
### Aliases: riverplot-styles riverplotStyle-class default.style
###   updateRiverplotStyle

### ** Examples

# To view the default style specification, type
default.style()

ex <- riverplot.example()
ds <- default.style()
plot( ex, default_style= ds )

# nodes with unspecified style will now be semi-transparent red:
ds[["col"]] <- "#FF000099"
plot( ex, default_style= ds )




