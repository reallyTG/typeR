library(bmixture)


### Name: mixnorm
### Title: Mixture of Normal distribution
### Aliases: rmixnorm dmixnorm

### ** Examples

## Not run: 
##D n      = 10000   
##D weight = c( 0.3, 0.5, 0.2 )
##D mean   = c( 0  , 10 , 3   )
##D sd     = c( 1  , 1  , 1   )
##D     
##D data = rmixnorm( n = n, weight = weight, mean = mean, sd = sd )
##D   
##D hist( data, prob = TRUE, nclass = 30, col = "gray" )
##D   
##D x           = seq( -20, 20, 0.05 )
##D densmixnorm = dmixnorm( x, weight, mean, sd )
##D       
##D lines( x, densmixnorm, lwd = 2 )
## End(Not run)



