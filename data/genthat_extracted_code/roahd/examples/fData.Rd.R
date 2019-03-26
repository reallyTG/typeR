library(roahd)


### Name: fData
### Title: 'S3' Class for univariate functional datasets.
### Aliases: fData

### ** Examples

# Defining parameters
N = 20
P = 1e2

# One dimensional grid
grid = seq( 0, 1, length.out = P )

# Generating an exponential covariance function (see related help for more
# information )
C = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Generating a synthetic dataset with a gaussian distribution and
# required mean and covariance function:
values = generate_gauss_fdata( N,
                               centerline = sin( 2 * pi * grid ),
                               Cov = C )

fD = fData( grid, values )




