library(roahd)


### Name: outliergram
### Title: Outliergram for univariate functional datasets
### Aliases: outliergram

### ** Examples



set.seed( 1618 )

N = 200
P = 200
N_extra = 4

grid = seq( 0, 1, length.out = P )

Cov = exp_cov_function( grid, alpha = 0.2, beta = 0.8 )

Data = generate_gauss_fdata( N,
                             centerline = sin( 4 * pi * grid ),
                             Cov = Cov )

Data_extra = array( 0, dim = c( N_extra, P ) )

Data_extra[ 1, ] = generate_gauss_fdata( 1,
                                         sin( 4 * pi * grid + pi / 2 ),
                                         Cov = Cov )

Data_extra[ 2, ] = generate_gauss_fdata( 1,
                                         sin( 4 * pi * grid - pi / 2 ),
                                         Cov = Cov )

Data_extra[ 3, ] = generate_gauss_fdata( 1,
                                         sin( 4 * pi * grid + pi/ 3 ),
                                         Cov = Cov )

Data_extra[ 4, ] = generate_gauss_fdata( 1,
                                         sin( 4 * pi * grid - pi / 3),
                                         Cov = Cov )
Data = rbind( Data, Data_extra )

fD = fData( grid, Data )

outliergram( fD, display = TRUE )

outliergram( fD, Fvalue = 2.5, display = TRUE )
## Not run: 
##D outliergram( fD,
##D              adjust = list( N_trials = 10,
##D                             trial_size = 5 * nrow( Data ),
##D                             TPR = 0.01,
##D                             VERBOSE = FALSE ),
##D              display = TRUE )
## End(Not run)




