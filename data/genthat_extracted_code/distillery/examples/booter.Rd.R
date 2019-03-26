library(distillery)


### Name: booter
### Title: Bootstrap Resampling
### Aliases: booter
### Keywords: datagen distribution nonparametric htest

### ** Examples


z <- rnorm( 100 )

zfun <- function( data, ... ) {

    return( c( mean( data ), var( data ), mean( data^2 ), var( data^2 ) ) )

} # end of 'zfun' function.

res <- booter( x = z, statistic = zfun, B = 500, v.terms = c(2, 4) )

print( res )

ci( res )



