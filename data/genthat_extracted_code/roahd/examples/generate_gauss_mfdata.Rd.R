library(roahd)


### Name: generate_gauss_mfdata
### Title: Generation of gaussian multivariate functional data
### Aliases: generate_gauss_mfdata

### ** Examples


N = 30
P = 1e2
L = 3

time_grid = seq( 0, 1, length.out = P )

C1 = exp_cov_function( time_grid, alpha = 0.1, beta = 0.2 )
C2 = exp_cov_function( time_grid, alpha = 0.2, beta = 0.5 )
C3 = exp_cov_function( time_grid, alpha = 0.3, beta = 1 )


centerline = matrix( c( sin( 2 * pi * time_grid ),
                        sqrt( time_grid ),
                        10 * ( time_grid - 0.5 ) * time_grid ),
                     nrow = 3, byrow = TRUE )

generate_gauss_mfdata( N, L, centerline,
                       correlations = c( 0.5, 0.5, 0.5 ),
                       listCov = list( C1, C2, C3 ) )

CholC1 = chol( C1 )
CholC2 = chol( C2 )
CholC3 = chol( C3 )

generate_gauss_mfdata( N, L, centerline,
                       correlations = c( 0.5, 0.5, 0.5 ),
                      listCholCov = list( CholC1, CholC2, CholC3 ) )




