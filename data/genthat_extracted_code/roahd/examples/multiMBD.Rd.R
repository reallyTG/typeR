library(roahd)


### Name: multiMBD
### Title: (Modified) Band Depth for multivariate functional data
### Aliases: multiMBD multiMBD.mfData multiMBD.default multiBD
###   multiBD.mfData multiBD.default

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

multiBD( mfD, weights = 'uniform' )
multiMBD( mfD, weights = 'uniform', manage_ties = TRUE )

multiBD( mfD, weights = c( 1/3, 2/3 ))
multiMBD( mfD, weights = c( 1/3, 2/3 ), manage_ties = FALSE )

multiBD( list( Data_1, Data_2 ), weights = 'uniform')
multiMBD( list( Data_1, Data_2 ), weights = 'uniform', manage_ties = TRUE )

multiBD( list( Data_1, Data_2 ), weights = c( 1/3, 2/3 ))
multiMBD( list( Data_1, Data_2 ), weights = c( 1/3, 2/3 ), manage_ties = FALSE )




