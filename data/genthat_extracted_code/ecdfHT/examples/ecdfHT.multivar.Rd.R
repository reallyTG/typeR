library(ecdfHT)


### Name: ecdfHT.multivar
### Title: Multivariate extensions of transformed empirical cdf plot
### Aliases: ecdfHT.2d ecdfHT.2d.axes ecdfHT.multivar
###   ecdfHT.multivar.transform lp.norm

### ** Examples

# independent components
set.seed(2)
x <- matrix( rcauchy(4000), ncol=4 )
ecdfHT.multivar( x )

# radially symmetric
r <- rcauchy(1000)
theta <- runif(1000,min=0,max=2*pi)
x <- cbind( r*cos(theta), r*sin(theta) )
ecdfHT.multivar( x )



