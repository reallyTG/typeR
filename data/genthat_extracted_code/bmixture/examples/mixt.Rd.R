library(bmixture)


### Name: mixt
### Title: Mixture of t-distribution
### Aliases: rmixt dmixt

### ** Examples

## Not run: 
##D n      = 10000   
##D weight = c( 0.3, 0.5, 0.2 )
##D df     = c( 4  , 4  , 4   )
##D mean   = c( 0  , 10 , 3   )
##D sd     = c( 1  , 1  , 1   )
##D     
##D data = rmixt( n = n, weight = weight, df = df, mean = mean, sd = sd )
##D   
##D hist( data, prob = TRUE, nclass = 30, col = "gray" )
##D   
##D x           = seq( -20, 20, 0.05 )
##D densmixt = dmixt( x, weight, df, mean, sd )
##D       
##D lines( x, densmixt, lwd = 2 )
## End(Not run)



