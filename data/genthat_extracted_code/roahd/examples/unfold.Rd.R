library(roahd)


### Name: unfold
### Title: Unfolding a univariate functional dataset
### Aliases: unfold

### ** Examples

P = 1e3

time_grid = seq( 0, 1, length.out = P )

D = matrix( c( sin( 2 * pi * time_grid ),
               cos( 2 * pi * time_grid ),
               sin( 10 * pi * time_grid ) * time_grid + 2 ),
            ncol = P, nrow = 3, byrow = TRUE )

# Functional dataset
fD = fData( time_grid, D )

# Unfolded version
fD_unfold = unfold( fD )

dev.new()
par( mfrow = c( 1, 2 ) )
plot( fD, main = 'Original data' )
plot( fD_unfold, main = 'Unfolded data' )




