library(roahd)


### Name: MHI
### Title: Modified Hypograph Index of univariate functional dataset
### Aliases: MHI MHI.fData MHI.default

### ** Examples


N = 20
P = 1e2

grid = seq( 0, 1, length.out = P )

C = exp_cov_function( grid, alpha = 0.2, beta = 0.3 )

Data = generate_gauss_fdata( N,
                             centerline = sin( 2 * pi * grid ),
                             C )
fD = fData( grid, Data )

MHI( fD )

MHI( Data )




