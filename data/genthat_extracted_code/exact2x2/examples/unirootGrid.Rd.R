library(exact2x2)


### Name: unirootGrid
### Title: Function to find a root by grid search.
### Aliases: unirootGrid
### Keywords: optimize

### ** Examples

# print.steps prints all iterations, 
# with x=rank of grid value (e.g., x=1 is lowest value in grid) 
# f(x) really is f(grid[x]) where grid is from the power2grid function 
unirootGrid(function(x){ x - .37}, power2=10, power2grid=power2gridRatio, 
  print.steps=TRUE, pos.side=TRUE)



