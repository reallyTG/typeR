library(roahd)


### Name: multivariate_outliergram
### Title: Outliergram for multivariate functional datasets
### Aliases: multivariate_outliergram

### ** Examples


N = 2e2
P = 1e2

t0 = 0
t1 = 1

set.seed(1)

# Defining the measurement grid
grid = seq( t0, t1, length.out = P )

# Generating an exponential covariance matrix to be used in the simulation of
# the functional datasets (see the related help for details)
C = exp_cov_function( grid, alpha = 0.3, beta = 0.2)

# Simulating the measurements of two univariate functional datasets with
# required center and covariance function
f1 = function(x) x * ( 1 - x )
f2 = function(x) x^3
Data = generate_gauss_mfdata( N, L = 2,
                              centerline = matrix(c(sin(2 * pi * grid),
                                                    cos(2 * pi * grid)), nrow=2, byrow=TRUE),
                              listCov = list(C, C), correlations = 0.1 )

# Building the mfData object
mfD = mfData( grid, Data )


dev.new()
out = multivariate_outliergram(mfD, Fvalue = 2., shift=TRUE)
col_non_outlying = scales::hue_pal( h = c( 180, 270 ),
                                    l = 60 )( N - length( out$ID_outliers ) )
col_non_outlying = set_alpha( col_non_outlying, 0.5 )
col_outlying = scales::hue_pal( h = c( - 90, 180  ),
                                c = 150 )( length( out$ID_outliers ) )
colors = rep('black', N)
colors[out$ID_outliers] = col_outlying
colors[colors == 'black'] = col_non_outlying

lwd = rep(1, N)
lwd[out$ID_outliers] = 2

dev.new()
plot(mfD, col=colors, lwd=lwd)




