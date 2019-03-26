library(LogConcDEAD)


### Name: interactive2D
### Title: A GUI for classification in two dimensions using smoothed
###   log-concave
### Aliases: interactive2D
### Keywords: nonparametric multivariate classification

### ** Examples

## Simple bivariate normal data
## only works interactively, not run as a test example here
#  set.seed( 1 )
#  n = 15
#  d = 2
#  props=c( 0.6, 0.4 )
#  x <- matrix( rnorm( n*d ), ncol = d )
#  shiftvec <- ifelse( runif( n ) > props[ 1 ], 0, 1)
#  x[,1] <- x[,1] + shiftvec
#  interactive2D( x, shiftvec )



