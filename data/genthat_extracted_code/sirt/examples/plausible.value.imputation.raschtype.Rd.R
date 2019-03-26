library(sirt)


### Name: plausible.value.imputation.raschtype
### Title: Plausible Value Imputation in Generalized Logistic Item Response
###   Model
### Aliases: plausible.value.imputation.raschtype
### Keywords: Plausible values

### ** Examples

#############################################################################
# EXAMPLE 1: Rasch model with covariates
#############################################################################

set.seed(899)
I <- 21     # number of items
b <- seq(-2,2, len=I)   # item difficulties
n <- 2000       # number of students

# simulate theta and covariates
theta <- stats::rnorm( n )
x <- .7 * theta + stats::rnorm( n, .5 )
y <- .2 * x+ .3*theta + stats::rnorm( n, .4 )
dfr <- data.frame( theta, 1, x, y )

# simulate Rasch model
dat1 <- sirt::sim.raschtype( theta=theta, b=b )

# Plausible value draws
pv1 <- sirt::plausible.value.imputation.raschtype(data=dat1, X=dfr[,-1], b=b,
            nplausible=3, iter=10, burnin=5)
# estimate linear regression based on first plausible value
mod1 <- stats::lm( pv1$pvdraws[,1] ~ x+y )
summary(mod1)
  ##               Estimate Std. Error t value Pr(>|t|)
  ##   (Intercept) -0.27755    0.02121  -13.09   <2e-16 ***
  ##   x            0.40483    0.01640   24.69   <2e-16 ***
  ##   y            0.20307    0.01822   11.15   <2e-16 ***

# true regression estimate
summary( stats::lm( theta ~ x + y ) )
  ## Coefficients:
  ##             Estimate Std. Error t value Pr(>|t|)
  ## (Intercept) -0.27821    0.01984  -14.02   <2e-16 ***
  ## x            0.40747    0.01534   26.56   <2e-16 ***
  ## y            0.18189    0.01704   10.67   <2e-16 ***

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Classical test theory, homogeneous regression variance
##D #############################################################################
##D 
##D set.seed(899)
##D n <- 3000       # number of students
##D x <- round( stats::runif( n, 0,1 ) )
##D y <- stats::rnorm(n)
##D # simulate true score theta
##D theta <- .4*x + .5 * y + stats::rnorm(n)
##D # simulate observed score by adding measurement error
##D sig.e <- rep( sqrt(.40), n )
##D theta_obs <- theta + stats::rnorm( n, sd=sig.e)
##D 
##D # define theta grid for evaluation of density
##D theta.list <- mean(theta_obs) + stats::sd(theta_obs) * seq( - 5, 5, length=21)
##D # compute individual likelihood
##D f.yi.qk <- stats::dnorm( outer( theta_obs, theta.list, "-" ) / sig.e )
##D f.yi.qk <- f.yi.qk / rowSums(f.yi.qk)
##D # define covariates
##D X <- cbind( 1, x, y )
##D # draw plausible values
##D mod2 <- sirt::plausible.value.imputation.raschtype( f.yi.qk=f.yi.qk,
##D                   theta.list=theta.list, X=X, iter=10, burnin=5)
##D 
##D # linear regression
##D mod1 <- stats::lm( mod2$pvdraws[,1] ~ x+y )
##D summary(mod1)
##D   ##             Estimate Std. Error t value Pr(>|t|)
##D   ## (Intercept) -0.01393    0.02655  -0.525      0.6
##D   ## x            0.35686    0.03739   9.544   <2e-16 ***
##D   ## y            0.53759    0.01872  28.718   <2e-16 ***
##D 
##D # true regression model
##D summary( stats::lm( theta ~ x + y ) )
##D   ##             Estimate Std. Error t value Pr(>|t|)
##D   ## (Intercept) 0.002931   0.026171   0.112    0.911
##D   ## x           0.359954   0.036864   9.764   <2e-16 ***
##D   ## y           0.509073   0.018456  27.584   <2e-16 ***
##D 
##D #############################################################################
##D # EXAMPLE 3: Classical test theory, heterogeneous regression variance
##D #############################################################################
##D 
##D set.seed(899)
##D n <- 5000       # number of students
##D x <- round( stats::runif( n, 0,1 ) )
##D y <- stats::rnorm(n)
##D # simulate true score theta
##D theta <- .4*x + .5 * y + stats::rnorm(n) * ( 1 - .4 * x )
##D # simulate observed score by adding measurement error
##D sig.e <- rep( sqrt(.40), n )
##D theta_obs <- theta + stats::rnorm( n, sd=sig.e)
##D 
##D # define theta grid for evaluation of density
##D theta.list <- mean(theta_obs) + stats::sd(theta_obs) * seq( - 5, 5, length=21)
##D # compute individual likelihood
##D f.yi.qk <- stats::dnorm( outer( theta_obs, theta.list, "-" ) / sig.e )
##D f.yi.qk <- f.yi.qk / rowSums(f.yi.qk)
##D # define covariates
##D X <- cbind( 1, x, y )
##D # draw plausible values (assuming variance homogeneity)
##D mod3a <- sirt::plausible.value.imputation.raschtype( f.yi.qk=f.yi.qk,
##D                   theta.list=theta.list, X=X, iter=10, burnin=5)
##D # draw plausible values (assuming variance heterogeneity)
##D #  -> include predictor Z
##D mod3b <- sirt::plausible.value.imputation.raschtype( f.yi.qk=f.yi.qk,
##D                   theta.list=theta.list, X=X, Z=X, iter=10, burnin=5)
##D 
##D # investigate variance of theta conditional on x
##D res3 <- sapply( 0:1, FUN=function(vv){
##D         c( stats::var(theta[x==vv]), stats::var(mod3b$pvdraw[x==vv,1]),
##D               stats::var(mod3a$pvdraw[x==vv,1]))})
##D rownames(res3) <- c("true", "pv(hetero)", "pv(homog)" )
##D colnames(res3) <- c("x=0","x=1")
##D   ## > round( res3, 2 )
##D   ##             x=0  x=1
##D   ## true       1.30 0.58
##D   ## pv(hetero) 1.29 0.55
##D   ## pv(homog)  1.06 0.77
##D ## -> assuming heteroscedastic variances recovers true conditional variance
## End(Not run)



