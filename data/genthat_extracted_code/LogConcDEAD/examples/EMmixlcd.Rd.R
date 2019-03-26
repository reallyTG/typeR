library(LogConcDEAD)


### Name: EMmixlcd
### Title: Estimate the mixture proportions and component densities using
###   EM algorithm
### Aliases: EMmixlcd
### Keywords: nonparametric multivariate EM classification

### ** Examples

##Simple bivariate normal data
  set.seed( 1 )
  n = 15
  d = 2
  props=c( 0.6, 0.4 )
  shift=2
  x <- matrix( rnorm( n*d ), ncol = d )
  shiftvec <- ifelse( runif( n ) > props[ 1 ], 0, shift )
  x[,1] <- x[,1] + shiftvec
  EMmixlcd( x, k = 2, max.iter = 5)



