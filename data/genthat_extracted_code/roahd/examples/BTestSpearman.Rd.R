library(roahd)


### Name: BTestSpearman
### Title: Bootstrap Hypothesis Test on Spearman Correlation Coefficients
###   for Multivariate Functional Data
### Aliases: BTestSpearman

### ** Examples


set.seed(1)
N = 2e2
P = 1e2
L = 2
grid = seq( 0, 1, length.out = P )
# Creating an exponential covariance function to simulate guassian data
Cov = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )



# Simulating two populations of bivariate functional data
#
# The first population has very high correlation between first and second component
centerline_1 = matrix(rep(sin(2 * pi * grid)), nrow = 2, ncol=P, byrow=TRUE)
values1 = generate_gauss_mfdata( N, L, correlations = 0.9,
                                 centerline = centerline_1, listCov = list(Cov, Cov)  )
mfD1 = mfData(grid, values1)

# Pointwise estimate
cor_spearman(mfD1)

# The second population has zero correlation between first and second component
centerline_2 = matrix(rep(cos(2 * pi * grid)), nrow = 2, ncol=P, byrow=TRUE)
values2 = generate_gauss_mfdata( N, L, correlations = 0,
                                 centerline = centerline_1, listCov = list(Cov, Cov)  )
mfD2 = mfData(grid, values2)

# Pointwise estimate
cor_spearman(mfD2)

# Applying the test
## Not run: 
##D BTestSpearman(mfD1, mfD2)
## End(Not run)



