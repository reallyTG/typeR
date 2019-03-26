library(bmixture)


### Name: print.bmixgamma
### Title: Print function for 'S3' class '"bmixgamma"'
### Aliases: print.bmixgamma

### ** Examples

## Not run: 
##D # simulating data from mixture of gamma with two components
##D n      = 500 # number of observations
##D weight = c( 0.6, 0.4 )
##D alpha  = c( 12 , 1   )
##D beta   = c( 3  , 2   )
##D 
##D data <- rmixgamma( n = n, weight = weight, alpha = alpha, beta = beta )
##D   
##D # plot for simulation data    
##D hist( data, prob = TRUE, nclass = 50, col = "gray" )
##D   
##D x     = seq( 0, 10, 0.05 )
##D truth = dmixgamma( x, weight, alpha, beta )
##D       
##D lines( x, truth, lwd = 2 )
##D   
##D # Runing bdmcmc algorithm for the above simulation data set      
##D bmixgamma.obj <- bmixgamma( data, iter = 500 )
##D     
##D print( bmixgamma.obj )
## End(Not run)



