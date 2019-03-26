library(Epi)


### Name: ROC
### Title: Function to compute and draw ROC-curves.
### Aliases: ROC
### Keywords: manip htest

### ** Examples

x <- rnorm( 100 )
z <- rnorm( 100 )
w <- rnorm( 100 )
tigol <- function( x ) 1 - ( 1 + exp( x ) )^(-1)
y <- rbinom( 100, 1, tigol( 0.3 + 3*x + 5*z + 7*w ) )
ROC( form = y ~ x + z, plot="ROC" )



