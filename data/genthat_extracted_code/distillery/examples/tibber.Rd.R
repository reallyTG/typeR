library(distillery)


### Name: tibber
### Title: Test-Inversion Bootstrap
### Aliases: tibber tibberRM
### Keywords: htest

### ** Examples

# The following example follows the example provided at:
#
# http://influentialpoints.com/Training/bootstrap_confidence_intervals.htm
#
# which is provided with a creative commons license:
#
# https://creativecommons.org/licenses/by/3.0/ 
#
y <- c( 7, 7, 6, 9, 8, 7, 8, 7, 7, 7, 6, 6, 6, 8, 7, 7, 7, 7, 6, 7,
        8, 7, 7, 6, 8, 7, 8, 7, 8, 7, 7, 7, 5, 7, 7, 7, 6, 7, 8, 7, 7,
        8, 6, 9, 7, 14, 12, 10, 13, 15 )

trm <- function( data, ... ) {

    res <- try( mean( data, trim = 0.1, ... ) )
    if( class( res ) == "try-error" ) return( NA )
    else return( res )

} # end of 'trm' function.

genf <- function( data, par, n, ... ) {

    y <- data * par
    h <- 1.06 * sd( y ) / ( n^( 1 / 5 ) )
    y <- y + rnorm( rnorm( n, 0, h ) )
    y <- round( y * ( y > 0 ) )

    return( y )

} # end of 'genf' function.

look <- tibber( x = y, statistic = trm, B = 500, rmodel = genf,
    test.pars = seq( 0.85, 1.15, length.out = 100 ) )

look

plot( look )
# outer vertical blue lines should cross horizontal blue lines
# where an estimated p-value is located.

tibber( x = y, statistic = trm, B = 500, rmodel = genf, test.pars = 1 )


## Not run: 
##D look2 <- tibberRM(x = y, statistic = trm, B = 500, rmodel = genf, startval = 1,
##D     step.size = 0.03, verbose = TRUE )
##D 
##D look2
##D # lower achieved est. p-value should be close to 0.025
##D # upper should be close to 0.975.
##D 
##D plot( look2 )
##D 
##D trm2 <- function( data, par, n, ... ) {
##D 
##D     a <- list( ... )
##D     res <- try( mean( data, trim = a$trim ) )
##D     if( class( res ) == "try-error" ) return( NA )
##D     else return( res )
##D 
##D } # end of 'trm2' function.
##D 
##D tibber( x = y, statistic = trm2, B = 500, rmodel = genf,
##D     test.pars = seq( 0.85, 1.15, length.out = 100 ), trim = 0.1 )
##D 
##D # Try getting the STIB interval.  v.terms = 2 below because mfun
##D # returns the variance of the estimated parameter in the 2nd position.
##D #
##D # Note: the STIB interval can be a bit unstable.
##D 
##D mfun <- function( data, ... ) return( c( mean( data ), var( data ) ) )
##D 
##D gennorm <- function( data, par, n, ... ) {
##D 
##D     return( rnorm( n = n, mean = mean( data ), sd = sqrt( par ) ) )
##D 
##D } # end of 'gennorm' function.
##D 
##D set.seed( 1544 )
##D z <- rnorm( 50 )
##D mean( z )
##D var( z )
##D 
##D # Trial-and-error is necessary to get a good result with interpolation method.
##D res <- tibber( x = z, statistic = mfun, B = 500, rmodel = gennorm,
##D     test.pars = seq( 0.95, 1.10, length.out = 100 ), v.terms = 2 )
##D 
##D res
##D 
##D plot( res )
##D 
##D # Much trial-and-error is necessary to get a good result with RM method.
##D # If it fails to converge, try increasing the tolerance.
##D res2 <- tibberRM( x = z, statistic = mfun, B = 500, rmodel = gennorm,
##D     startval = c( 0.95, 1.1 ), step.size = 0.003, tol = 0.001, v.terms = 2,
##D     verbose = TRUE )
##D # Note that it only gives the STIB interval.
##D 
##D res2
##D 
##D plot( res2 )
##D 
## End(Not run)



