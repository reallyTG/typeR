library(SOMbrero)


### Name: initGrid
### Title: Create an empty Self-Organizing Map structure
### Aliases: initGrid print.myGrid summary.myGrid
### Keywords: classes

### ** Examples

# creating a default grid
# default parameters are: 5x5 dimension, squared topology 
# and letremy distance type
initGrid()

# creating a 5x7 squared grid
initGrid(dimension=c(5, 7), topo="square", dist.type="maximum")



