library(roahd)


### Name: sub-.fData
### Title: Operator 'sub-.fData' to subset 'fData' obejcts
### Aliases: sub-.fData [.fData

### ** Examples


N = 20
P = 1e2

# One dimensional grid
grid = seq( 0, 1, length.out = P )

# Generating an exponential covariance function (see related help for more
# information )
C = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Generating a synthetic dataset with a gaussian distribution and
# required mean and covariance function:
fD = fData( grid,
            generate_gauss_fdata( N,
                                  centerline = sin( 2 * pi * grid ),
                                  Cov = C ) )

dev.new()
par( mfrow = c( 2, 2 ) )

# Original data
plot( fD )

# Subsetting observations
plot( fD[ c(1,2,3), , as_fData = TRUE ] )

# Subsetting measurements
plot( fD[ , 1 : 30 ] )

# Subsetting both observations and measurements
plot( fD[ 1 : 10, 50 : P ] )

# Subsetting both observations and measurements but returning a matrix
fD[ 1 : 10, 50 : P, as_fData = FALSE ]




