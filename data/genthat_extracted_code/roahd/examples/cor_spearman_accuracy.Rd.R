library(roahd)


### Name: cor_spearman_accuracy
### Title: Bootstrap Spearman's correlation coefficient for multivariate
###   functional data
### Aliases: cor_spearman_accuracy

### ** Examples


N = 2e2
P = 1e2
grid = seq( 0, 1, length.out = P )

# Creating an exponential covariance function to simulate guassian data
Cov = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Simulating (independent) gaussian functional data with given center and covariance function

Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = Cov )

# Using the simulated data as (independent) components of a bivariate functional dataset
mfD = mfData( grid, list( Data_1, Data_2 ) )
## Not run: 
##D cor_spearman_accuracy(mfD, ordering='MEI')
##D 
##D cor_spearman_accuracy(mfD, ordering='MHI')
## End(Not run)



