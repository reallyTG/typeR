library(miceadds)


### Name: ma.scale2
### Title: Standardization of a Matrix
### Aliases: ma.scale2
### Keywords: z-Standardization Utility function

### ** Examples

#############################################################################
# EXAMPLE 1: z-standardization data.internet
#############################################################################

data(data.internet)
dat <- data.internet

# z-standardize all variables in this dataset
zdat <- miceadds::ma.scale2( dat, missings=TRUE )

## Not run: 
##D #############################################################################
##D # SIMULATED EXAMPLE 2: Speed comparison for many cases and many variables
##D #############################################################################
##D 
##D set.seed(9786)
##D # 3000 cases, 200 variables
##D N <- 3000
##D p <- 200
##D # simulate some data
##D x <- matrix( stats::rnorm( N*p ), N, p )
##D x <- round( x, 2 )
##D 
##D # compare computation times for 10 replications
##D B <- 10
##D     s1 <- Sys.time()        # scale in R
##D for (bb in 1:B){
##D     res <- scale(x)
##D } ; s2 <- Sys.time() ; d1 <- s2-s1
##D 
##D     s1 <- Sys.time()        # scale in miceadds
##D for (bb in 1:B){
##D     res1 <- miceadds::ma.scale2(x)
##D } ; s2 <- Sys.time() ; d2 <- s2-s1
##D 
##D # scale in miceadds with missing handling
##D     s1 <- Sys.time()
##D for (bb in 1:B){
##D     res1 <- miceadds::ma.scale2(x,missings=TRUE)
##D } ; s2 <- Sys.time() ; d3 <- s2-s1
##D d1      # scale in R
##D d2      # scale in miceadds (no missing handling)
##D d3      # scale in miceadds (with missing handling)
##D   ##   > d1      # scale in R
##D   ##   Time difference of 1.622431 secs
##D   ##   > d2      # scale in miceadds (no missing handling)
##D   ##   Time difference of 0.156003 secs
##D   ##   > d3      # scale in miceadds (with missing handling)
##D   ##   Time difference of 0.2028039 secs
## End(Not run)



