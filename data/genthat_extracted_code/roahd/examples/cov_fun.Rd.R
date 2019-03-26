library(roahd)


### Name: cov_fun
### Title: Covariance function for functional data
### Aliases: cov_fun cov_fun.fData cov_fun.mfData

### ** Examples


# Generating a univariate functional dataset
N = 1e2

P = 1e2
t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

Cov = exp_cov_function( time_grid, alpha = 0.3, beta = 0.4 )

D1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )
D2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )

fD1 = fData( time_grid, D1 )
fD2 = fData( time_grid, D2 )

# Computing the covariance function of fD1

C = cov_fun( fD1 )
str( C )

# Computing the cross-covariance function of fD1 and fD2
CC = cov_fun( fD1, fD2 )
str( CC )

# Generating a multivariate functional dataset
L = 3

C1 = exp_cov_function( time_grid, alpha = 0.1, beta = 0.2 )
C2 = exp_cov_function( time_grid, alpha = 0.2, beta = 0.5 )
C3 = exp_cov_function( time_grid, alpha = 0.3, beta = 1 )

centerline = matrix( c( sin( 2 * pi * time_grid ),
                        sqrt( time_grid ),
                        10 * ( time_grid - 0.5 ) * time_grid ),
                     nrow = 3, byrow = TRUE )

D3 = generate_gauss_mfdata( N, L, centerline,
                       correlations = c( 0.5, 0.5, 0.5 ),
                       listCov = list( C1, C2, C3 ) )

# adding names for better readability of BC3's labels
names( D3 ) = c( 'comp1', 'comp2', 'comp3' )
mfD3 = mfData( time_grid, D3 )

D1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ),
                              Cov = Cov )
fD1 = fData( time_grid, D1 )

# Computing the block covariance function of mfD3
BC3 = cov_fun( mfD3 )
str( BC3 )

# computing cross-covariance between mfData and fData objects
CC = cov_fun( mfD3, fD1 )
str( CC )




