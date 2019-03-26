library(roahd)


### Name: BCIntervalSpearman
### Title: Bootstrap Confidence Interval on Spearman's Correlation
###   Coefficient between Univariate Functional Datasets
### Aliases: BCIntervalSpearman

### ** Examples


set.seed(1)

N = 2e2
P = 1e2
grid = seq( 0, 1, length.out = P )

# Creating an exponential covariance function to simulate guassian data
Cov = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Simulating (independent) gaussian functional data with given center and
# covariance function
Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )

# Using the simulated data as (independent) components of a bivariate functional
# dataset
mfD = mfData( grid, list( Data_1, Data_2 ) )
## Not run: 
##D BCIntervalSpearman(mfD$fDList[[1]], mfD$fDList[[2]], ordering = 'MEI')
##D 
##D BCIntervalSpearman(mfD$fDList[[1]], mfD$fDList[[2]], ordering = 'MHI')
## End(Not run)
# BC intervals contain zero since the functional samples are uncorrelated.




