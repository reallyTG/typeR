library(roahd)


### Name: median_fData
### Title: Median of a univariate functional dataset
### Aliases: median_fData

### ** Examples


N = 1e2
P = 1e2
grid = seq( 0, 1, length.out = P )

# Generating a gaussian functional sample with desired mean
# Being the distribution symmetric, the sample mean and median are coincident
target_median = sin( 2 * pi * grid )
C = exp_cov_function( grid, alpha = 0.2, beta = 0.2 )
fD = fData( grid, generate_gauss_fdata( N,
                                      centerline = target_median,
                                       Cov = C ) )

# Graphical representation of the mean
plot( fD )
plot( median_fData( fD ), col = 'black', lwd = 2, lty = 2, add = TRUE )




