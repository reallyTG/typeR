library(ContourFunctions)


### Name: cf
### Title: Simpler function for making contours with cf package. Won't give
###   argument completion, so all must be specified
### Aliases: cf

### ** Examples

cf(function(x){x[1]^2 - x[2]})
x <- runif(20)
y <- runif(20)
z <- exp(-(x-.5)^2-5*(y-.5)^2)# + rnorm(20,0,.05)
cf(x,y,z)



