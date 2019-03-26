library(maxLik)


### Name: nParam.maxim
### Title: Number of model parameters
### Aliases: nParam.maxim
### Keywords: methods

### ** Examples

## fit a normal distribution by ML
# generate a variable from normally distributed random numbers
x <- rnorm( 100, 1, 2 )
# log likelihood function (for individual observations)
llf <- function( param ) {
   return( dnorm( x, mean = param[ 1 ], sd = param[ 2 ], log = TRUE ) )
}
## ML method
ml <- maxLik( llf, start = c( mu = 0, sigma = 1 ) )
# return number of parameters
nParam( ml )



