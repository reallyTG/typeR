library(roahd)


### Name: mfData
### Title: 'S3' class for multivariate functional datasets
### Aliases: mfData

### ** Examples

# Defining parameters
N = 1e2

P = 1e3

t0 = 0
t1 = 1

# Defining the measurement grid
grid = seq( t0, t1, length.out = P )

# Generating an exponential covariance matrix to be used in the simulation of
# the functional datasets (see the related help for details)
C = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Simulating the measurements of two univariate functional datasets with
# required center and covariance function
Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = C )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = C )

# Building the mfData object
mfData( grid, list( Data_1, Data_2 ) )




