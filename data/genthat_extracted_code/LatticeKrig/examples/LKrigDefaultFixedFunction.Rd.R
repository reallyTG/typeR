library(LatticeKrig)


### Name: LKrigDefaultFixedFunction
### Title: Creates fixed part of spatial model.
### Aliases: LKrigDefaultFixedFunction LKrigPeriodicFixedFunction
###   predictLKrigFixedFunction
### Keywords: spatial

### ** Examples

x<- matrix( runif(100), nrow=50)
# linear polynomial 
T.matrix<- LKrigDefaultFixedFunction(x, m=2)
# quadratic polynomial 
T.matrix<- LKrigDefaultFixedFunction(x, m=3)



