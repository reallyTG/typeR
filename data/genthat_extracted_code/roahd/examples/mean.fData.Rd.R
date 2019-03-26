library(roahd)


### Name: mean.fData
### Title: Cross-sectional mean of of a fData object.
### Aliases: mean.fData

### ** Examples


N = 1e2
P = 1e2
grid = seq( 0, 1, length.out = P )

# Generating a gaussian functional sample with desired mean
target_mean = sin( 2 * pi * grid )
C = exp_cov_function( grid, alpha = 0.2, beta = 0.2 )
fD = fData( grid, generate_gauss_fdata( N,
                                      centerline = target_mean,
                                       Cov = C ) )

# Graphical representation of the mean
plot( fD )
plot( mean( fD ), col = 'black', lwd = 2, lty = 2, add = TRUE )





