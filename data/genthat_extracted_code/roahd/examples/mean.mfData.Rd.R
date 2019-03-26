library(roahd)


### Name: mean.mfData
### Title: Cross-sectional mean of of a mfData object.
### Aliases: mean.mfData

### ** Examples


N = 1e2
L = 3
P = 1e2
grid = seq( 0, 1, length.out = P )

# Generating a gaussian functional sample with desired mean
target_mean = sin( 2 * pi * grid )
C = exp_cov_function( grid, alpha = 0.2, beta = 0.2 )
# Independent components
correlations = c( 0, 0, 0 )
mfD = mfData( grid,
              generate_gauss_mfdata( N, L,
                                     correlations = correlations,
                                     centerline = matrix( target_mean,
                                                          nrow = 3,
                                                          ncol = P,
                                                          byrow = TRUE ),
                                     listCov = list( C, C, C ) )
)

# Graphical representation of the mean
par( mfrow = c( 1, 3 ) )

for( iL in 1 : L )
{
  plot( mfD$fDList[[ 1 ]] )
  plot( mean( mfD )$fDList[[ 1 ]], col = 'black',
        lwd = 2, lty = 2, add = TRUE )
}



