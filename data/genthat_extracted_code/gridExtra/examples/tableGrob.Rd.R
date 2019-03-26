library(gridExtra)


### Name: tableGrob
### Title: Graphical display of a textual table
### Aliases: tableGrob grid.table ttheme_default ttheme_minimal grid.table
###   ttheme_default ttheme_minimal

### ** Examples

library(grid)
d <- head(iris, 3)
g <- tableGrob(d)
grid.newpage()
grid.draw(g)



