library(rgl)


### Name: plotmath3d
### Title: Generate sprites using base graphics math plotting.
### Aliases: plotmath3d

### ** Examples

open3d()
plotmath3d(1:3, 1:3, 1:3, expression(x[1] == 1, x[2] == 2, x[3] == 3))
# This lets the text resize with the plot
text3d(4, 4, 4, "resizeable text", usePlotmath = TRUE, fixedSize = FALSE)



