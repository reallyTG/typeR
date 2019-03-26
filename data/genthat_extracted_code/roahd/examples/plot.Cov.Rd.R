library(roahd)


### Name: plot.Cov
### Title: Specialised method to plot 'Cov' objects
### Aliases: plot.Cov

### ** Examples


# Generating a univariate functional dataset
N = 1e2

P = 1e2
t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

Cov = exp_cov_function( time_grid, alpha = 0.3, beta = 0.4 )

D1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )

fD1 = fData( time_grid, D1 )

# Computing the covariance function of fD1

plot( cov_fun( fD1 ), main = 'Covariance function', xlab = 'time', ylab = 'time' )




