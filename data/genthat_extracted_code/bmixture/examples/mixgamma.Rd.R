library(bmixture)


### Name: mixgamma
### Title: Mixture of Gamma distribution
### Aliases: rmixgamma dmixgamma

### ** Examples

## Not run: 
##D n      = 10000   
##D weight = c( 0.6  , 0.3  , 0.1   )
##D alpha  = c( 100  , 200  , 300   )
##D beta   = c( 100/3, 200/4, 300/5 )
##D     
##D data = rmixgamma( n = n, weight = weight, alpha = alpha, beta = beta )
##D   
##D hist( data, prob = TRUE, nclass = 30, col = "gray" )
##D   
##D x            = seq( -20, 20, 0.05 )
##D densmixgamma = dmixnorm( x, weight, alpha, beta )
##D       
##D lines( x, densmixgamma, lwd = 2 )
## End(Not run)



