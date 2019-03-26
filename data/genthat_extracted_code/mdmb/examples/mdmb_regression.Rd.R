library(mdmb)


### Name: mdmb_regression
### Title: Several Regression Models with Prior Distributions and Sampling
###   Weights
### Aliases: logistic_regression coef.logistic_regression
###   vcov.logistic_regression logLik.logistic_regression
###   summary.logistic_regression predict.logistic_regression
###   yjt_regression coef.yjt_regression vcov.yjt_regression
###   logLik.yjt_regression summary.yjt_regression predict.yjt_regression
###   bct_regression coef.bct_regression vcov.bct_regression
###   logLik.bct_regression summary.bct_regression predict.bct_regression
###   oprobit_regression coef.oprobit_regression vcov.oprobit_regression
###   logLik.oprobit_regression summary.oprobit_regression
###   predict.oprobit_regression

### ** Examples

#############################################################################
# EXAMPLE 1: Simulated example logistic regression
#############################################################################

#--- simulate dataset
set.seed(986)
N <- 500
x <- stats::rnorm(N)
y <- 1*( stats::runif(N) < stats::plogis( -0.8 + 1.2 * x ) )
data <- data.frame( x=x, y=y )

#--- estimate logistic regression with mdmb::logistic_regression
mod1 <- mdmb::logistic_regression( y ~ x, data=data )
summary(mod1)

## Not run: 
##D #--- estimate logistic regression with stats::glm
##D mod1b <- stats::glm( y ~ x, data=data, family="binomial")
##D summary(mod1b)
##D 
##D #--- estimate logistic regression with prior distributions
##D b0 <- list( "dnorm", list(mean=0, sd=100) )  # first parameter
##D b1 <- list( "dcauchy", list(location=0, scale=2.5) )   # second parameter
##D beta_priors <- list( b0, b1 )  # order in list defines priors for parameters
##D #* estimation
##D mod2 <- mdmb::logistic_regression( y ~ x, data=data, beta_prior=beta_priors )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Yeo-Johnson transformed scaled t regression
##D #############################################################################
##D 
##D #*** create simulated data
##D set.seed(9865)
##D n <- 1000
##D x <- stats::rnorm(n)
##D y <- .5 + 1*x + .7*stats::rt(n, df=8 )
##D y <- mdmb::yj_antitrafo( y, lambda=.5 )
##D dat <- data.frame( y=y, x=x )
##D # display data
##D graphics::hist(y)
##D 
##D #--- Model 1: fit regression model with transformed normal distribution (df=Inf)
##D mod1 <- mdmb::yjt_regression( y ~ x, data=dat )
##D summary(mod1)
##D 
##D #--- Model 2: fit regression model with transformed scaled t distribution (df=10)
##D mod2 <- mdmb::yjt_regression( y ~ x, data=dat, df=10)
##D summary(mod2)
##D 
##D #--- Model 3: fit regression model with transformed normal distribution (df=Inf)
##D #             and fixed transformation parameter lambda of .5
##D mod3 <- mdmb::yjt_regression( y ~ x, data=dat, lambda_fixed=.5)
##D summary(mod3)
##D 
##D #--- Model 4: fit regression model with transformed normal distribution (df=Inf)
##D #             and fixed transformation parameter lambda of 1
##D #             -> This model corresponds to least squares regression
##D mod4 <- mdmb::yjt_regression( y ~ x, data=dat, lambda_fixed=1)
##D summary(mod4)
##D 
##D # fit with lm function
##D mod4b <- stats::lm( y ~ x, data=dat )
##D summary(mod4b)
##D 
##D #--- Model 5: fit regression model with estimated degrees of freedom
##D mod5 <- mdmb::yjt_regression( y ~ x, data=dat, est_df=TRUE)
##D summary(mod5)
##D 
##D #** compare log-likelihood values
##D logLik(mod1)
##D logLik(mod2)
##D logLik(mod3)
##D logLik(mod4)
##D logLik(mod4b)
##D logLik(mod5)
##D 
##D #############################################################################
##D # EXAMPLE 3: Regression with Box-Cox and Yeo-Johnson transformations
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(985)
##D n <- 1000
##D x <- stats::rnorm(n)
##D y <- .5 + 1*x + stats::rnorm(n, sd=.7 )
##D y <- mdmb::bc_antitrafo( y, lambda=.5 )
##D dat <- data.frame( y=y, x=x )
##D 
##D #--- Model 1: fit regression model with Box-Cox transformation
##D mod1 <- mdmb::bct_regression( y ~ x, data=dat )
##D summary(mod1)
##D #--- Model 2: fit regression model with Yeo-Johnson transformation
##D mod2 <- mdmb::yjt_regression( y ~ x, data=dat )
##D summary(mod2)
##D #--- compare fit
##D logLik(mod1)
##D logLik(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 4: Ordinal probit regression
##D #############################################################################
##D 
##D #--- simulate data
##D set.seed(987)
##D N <- 1500
##D x <- stats::rnorm(N)
##D z <- stats::rnorm(N)
##D # regression coefficients
##D b0 <- -.5 ; b1 <- .6 ; b2 <- .1
##D # vector of thresholds
##D thresh <- c(-1, -.3, 1)
##D yast <- b0 + b1 * x + b2*z + stats::rnorm(N)
##D y <- as.numeric( cut( yast, c(-Inf,thresh,Inf) ) ) - 1
##D dat <- data.frame( x=x, y=y, z=z )
##D 
##D #--- probit regression
##D mod <- mdmb::oprobit_regression( formula=y ~ x + z + I(x*z), data=dat)
##D summary(mod)
## End(Not run)



