library(miceadds)


### Name: kernelpls.fit2
### Title: Kernel PLS Regression
### Aliases: kernelpls.fit2 predict.kernelpls.fit2
### Keywords: Partial least squares regression (PLS) Dimension reduction
###   predict

### ** Examples

#############################################################################
# SIMULATED EXAMPLE 1: 300 cases on 100 variables
#############################################################################
set.seed(789)

N <- 300        # number of cases
p <- 100        # number of predictors
rho1 <- .6      # correlations between predictors

# simulate data
Sigma <- base::diag(1-rho1,p) + rho1
X <- mvtnorm::rmvnorm( N, sigma=Sigma )
beta <- base::seq( 0, 1, len=p )
y <- ( X %*% beta )[,1] + stats::rnorm( N, sd=.6 )
Y <- base::matrix(y,nrow=N, ncol=1 )

# PLS regression
res <- miceadds::kernelpls.fit2( X=X, Y=Y, ncomp=20 )

# predict new scores
Xpred <- predict( res, X=X[1:10,] )

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Dataset yarn from pls package
##D #############################################################################
##D 
##D # use kernelpls.fit from pls package
##D library(pls)
##D data(yarn,package="pls")
##D mod1 <- pls::kernelpls.fit( X=yarn$NIR, Y=yarn$density, ncomp=10 )
##D # use kernelpls.fit2 from miceadds package
##D Y <- base::matrix( yarn$density, ncol=1 )
##D mod2 <- miceadds::kernelpls.fit2( X=yarn$NIR, Y=Y, ncomp=10 )
## End(Not run)



