library(roahd)


### Name: HI
### Title: Hypograph Index of univariate functional dataset
### Aliases: HI HI.fData HI.default

### ** Examples


N = 20
P = 1e2

grid = seq( 0, 1, length.out = P )

C = exp_cov_function( grid, alpha = 0.2, beta = 0.3 )

Data = generate_gauss_fdata( N,
                             centerline = sin( 2 * pi * grid ),
                             C )
fD = fData( grid, Data )

HI( fD )

HI( Data )




