library(roahd)


### Name: median_mfData
### Title: Median of a multivariate functional dataset
### Aliases: median_mfData

### ** Examples


N = 1e2
L = 3
P = 1e2
grid = seq( 0, 1, length.out = P )

# Generating a gaussian functional sample with desired mean
# Being the distribution symmetric, the sample mean and median are coincident
target_median = sin( 2 * pi * grid )
C = exp_cov_function( grid, alpha = 0.2, beta = 0.2 )

# Strongly dependent components
correlations = c( 0.9, 0.9, 0.9 )
mfD = mfData( grid,
              generate_gauss_mfdata( N, L,
                                     correlations = correlations,
                                     centerline = matrix( target_median,
                                                          nrow = 3,
                                                          ncol = P,
                                                          byrow = TRUE ),
                                     listCov = list( C, C, C ) )
)

med_mfD = median_mfData( mfD, type = 'multiMBD', weights = 'uniform' )

# Graphical representation of the mean
par( mfrow = c( 1, 3 ) )

for( iL in 1 : L )
{
  plot( mfD$fDList[[ 1 ]] )
  plot( med_mfD$fDList[[ 1 ]], col = 'black',
        lwd = 2, lty = 2, add = TRUE )
}



