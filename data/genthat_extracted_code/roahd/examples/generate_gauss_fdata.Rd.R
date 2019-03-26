library(roahd)


### Name: generate_gauss_fdata
### Title: Generation of gaussian univariate functional data
### Aliases: generate_gauss_fdata

### ** Examples


N = 30
P = 1e2

t0 = 0
tP = 1

time_grid = seq( t0, tP, length.out = P )

C = exp_cov_function( time_grid, alpha = 0.1, beta = 0.2 )

CholC = chol( C )

centerline = sin( 2 * pi * time_grid )

invisible(generate_gauss_fdata( N, centerline, Cov = C ))

invisible(generate_gauss_fdata( N, centerline, CholCov = CholC ))




