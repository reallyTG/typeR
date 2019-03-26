library(distillery)


### Name: pbooter
### Title: Parametric Bootstrap Resampling
### Aliases: pbooter
### Keywords: distribution datagen

### ** Examples

z <- rnorm( 100 )

zfun <- function( data, ... ) {

    return( c( mean( data ), var( data ), mean( data^2 ), var( data^2 ) ) )

} # end of 'zfun' function.

rfun <- function( size, ... ) rnorm( size, ... )

res <- pbooter( x = z, statistic = zfun, rmodel = rfun, B = 500,
    rsize = 100, v.terms = c(2, 4) )

print( res )

ci( res )




