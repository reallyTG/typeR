library(roahd)


### Name: multiMEI
### Title: Modified Epigraph Index for multivariate functional data
### Aliases: multiMEI multiMEI.mfData multiMEI.default

### ** Examples

N = 20
P = 1e3

grid = seq( 0, 10, length.out = P )

# Generating an exponential covariance function to be used to simulate gaussian
# functional data
Cov = exp_cov_function( grid, alpha = 0.2, beta = 0.8 )

# First component of the multivariate guassian functional dataset
Data_1 = generate_gauss_fdata( N, centerline = rep( 0, P ), Cov = Cov )

# First component of the multivariate guassian functional dataset
Data_2 = generate_gauss_fdata( N, centerline = rep( 0, P ), Cov = Cov )

mfD = mfData( grid, list( Data_1, Data_2 ) )

# Uniform weights
multiMEI( mfD, weights = 'uniform' )

# Non-uniform, custom weights
multiMEI( mfD, weights = c(2/3, 1/3) )




