library(ggChernoff)


### Name: chernoffGrob
### Title: Draw a smiley face
### Aliases: chernoffGrob

### ** Examples

face <- chernoffGrob(.5, .5, size = 1e3, smile = -1, brow = 1, colour = 'navy', fill = 'lightblue')
grid::grid.newpage()
grid::grid.draw(face)



