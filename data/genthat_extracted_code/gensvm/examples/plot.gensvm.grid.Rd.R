library(gensvm)


### Name: plot.gensvm.grid
### Title: Plot the simplex space of the best fitted model in the
###   GenSVMGrid
### Aliases: plot.gensvm.grid

### ** Examples

## No test: 
x <- iris[, -5]
y <- iris[, 5]

grid <- gensvm.grid(x, y)
plot(grid, x)
## End(No test)




