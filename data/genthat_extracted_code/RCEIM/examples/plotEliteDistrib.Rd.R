library(RCEIM)


### Name: plotEliteDistrib
### Title: Plot the distribution of elite members
### Aliases: plotEliteDistrib
### Keywords: misc

### ** Examples

# Solve a simple 2D problem and show the distribution of the parameters
po <- ceimOpt(OptimFunction=function(x){(x[1]+1)^2+(x[2]+2)^2}, maxIter=100, 
      epsilon=0.1, nParams=2)
plotEliteDistrib(po$EliteMembers)
rm(po)



