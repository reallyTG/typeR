library(roahd)


### Name: fbplot
### Title: Functional boxplot of univariate and multivariate functional
###   data
### Aliases: fbplot fbplot.fData fbplot.mfData

### ** Examples


# UNIVARIATE FUNCTIONAL BOXPLOT - NO ADJUSTMENT

set.seed(1)

N = 2 * 100 + 1
P = 2e2

grid = seq( 0, 1, length.out = P )

D = 10 * matrix( sin( 2 * pi * grid ), nrow = N, ncol = P, byrow = TRUE )

D = D + rexp(N, rate = 0.05)


# c( 0, 1 : (( N - 1 )/2), -( ( ( N - 1 ) / 2 ) : 1 ) )^4


fD = fData( grid, D )

dev.new()
par( mfrow = c(1,3) )
plot( fD, lwd = 2, main = 'Functional dataset',
      xlab = 'time', ylab = 'values' )

fbplot( fD, main = 'Functional boxplot', xlab = 'time', ylab = 'values', Fvalue = 1.5 )

boxplot(fD$values[,1], ylim = range(fD$values), main = 'Boxplot of functional dataset at t_0 ' )

# UNIVARIATE FUNCTIONAL BOXPLOT - WITH ADJUSTMENT


set.seed( 161803 )

P = 2e2
grid = seq( 0, 1, length.out = P )

N = 1e2

# Generating a univariate synthetic gaussian dataset
Data = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ),
                             Cov = exp_cov_function( grid,
                                                     alpha = 0.3,
                                                     beta  = 0.4 ) )
fD = fData( grid, Data )

dev.new()
## Not run: 
##D fbplot( fD, adjust = list( N_trials = 10,
##D                            trial_size = 5 * N,
##D                            VERBOSE = TRUE ),
##D                      xlab = 'time', ylab = 'Values',
##D                      main = 'My adjusted functional boxplot' )
## End(Not run)

# MULTIVARIATE FUNCTIONAL BOXPLOT - NO ADJUSTMENT

set.seed( 1618033 )

P = 1e2
N = 1e2
L = 2

grid = seq( 0, 1, length.out = 1e2 )

C1 = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )
C2 = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Generating a bivariate functional dataset of gaussian data with partially
# correlated components
Data = generate_gauss_mfdata( N, L,
                              centerline = matrix( sin( 2 * pi * grid ),
                                                   nrow = 2, ncol = P,
                                                   byrow = TRUE ),
                              correlations = rep( 0.5, 1 ),
                              listCov = list( C1, C2 ) )

mfD = mfData( grid, Data )

dev.new()
fbplot( mfD, Fvalue = 2.5, xlab = 'time', ylab = list( 'Values 1',
                                                       'Values 2' ),
        main = list( 'First component', 'Second component' ) )






