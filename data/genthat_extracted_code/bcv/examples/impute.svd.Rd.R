library(bcv)


### Name: impute.svd
### Title: Missing value imputation via the SVDImpute algorithm
### Aliases: impute.svd

### ** Examples

  # Generate a matrix with missing entries    
  n <- 20
  p <- 10
  u <- rnorm( n )
  v <- rnorm( p )
  xfull <- u %*% rbind( v ) + rnorm( n*p )
  miss  <- sample( seq_len( n*p ), n )
  x       <- xfull
  x[miss] <- NA
      
  # impute the missing entries with a rank-1 SVD approximation
  xhat <- impute.svd( x, 1 )$x   
  
  # compute the prediction error for the missing entries
  sum( ( xfull-xhat )^2 )



