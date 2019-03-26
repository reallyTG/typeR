library(bmixture)


### Name: summary.bmixnorm
### Title: Summary function for 'S3' class '"bmixnorm"'
### Aliases: summary.bmixnorm

### ** Examples

## Not run: 
##D # simulating data from mixture of Normal with 3 components
##D n      = 500
##D weight = c( 0.3, 0.5, 0.2 )
##D mean   = c( 0  , 10 , 3   )
##D sd     = c( 1  , 1  , 1   )
##D     
##D data = rmixnorm( n = n, weight = weight, mean = mean, sd = sd )
##D 
##D # plot for simulation data      
##D hist( data, prob = TRUE, nclass = 30, col = "gray" )
##D   
##D x           = seq( -20, 20, 0.05 )
##D densmixnorm = dmixnorm( x, weight, mean, sd )
##D       
##D lines( x, densmixnorm, lwd = 2 )  
##D     
##D # Runing bdmcmc algorithm for the above simulation data set      
##D bmixnorm.obj = bmixnorm( data, k = 3, iter = 1000 )
##D     
##D summary( bmixnorm.obj ) 
## End(Not run)



