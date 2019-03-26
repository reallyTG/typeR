library(roahd)


### Name: warp
### Title: Warp elements of a univariate functional dataset
### Aliases: warp

### ** Examples


set.seed( 1618033 )

N = 30

t0 = 0
t1 = 1
P = 1e3 + 1

time_grid = seq( t0, t1, length.out = P )

means = round( runif( N,
                      t0 + (t1 - t0) / 8,
                      t1 - (t1 - t0) / 8  ), 3 )

Data = matrix( sapply( means,
                       function( m )( dnorm( time_grid, mean = m, sd = 0.05 ) ) ),
               ncol = P, nrow = N, byrow = TRUE )

fD = fData( time_grid, Data )

# Piecewise linear warpings
template_warping = function( m )( c( time_grid[ time_grid <= 0.5 ] * m / 0.5,
                                     ( time_grid[ time_grid > 0.5 ]
                                       - 0.5 ) * (1 - m ) / 0.5 + m ) )


warpings = matrix( sapply( means, template_warping ),
                   ncol = P,
                   nrow = N, byrow = TRUE )

wfD = fData( time_grid, warpings )

fD_warped = warp( fD, wfD )

dev.new()
par( mfrow = c( 1, 3 ) )
plot( fD,
     main = 'Unregistered functions', xlab = 'actual grid', ylab = 'values'  )
plot( wfD,
     main = 'Warping functions', xlab = 'registered grid',
     ylab = 'actual grid' )
plot( fD_warped,
     main = 'Warped functions', xlab = 'registered grid',
     ylab = 'values' )




