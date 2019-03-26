library(mdmb)


### Name: yjt_dist
### Title: Scaled t Distribution with Yeo-Johnson and Box-Cox
###   Transformations
### Aliases: yjt_dist yj_trafo yj_antitrafo dt_scaled rt_scaled
###   fit_t_scaled coef.fit_t_scaled logLik.fit_t_scaled
###   summary.fit_t_scaled vcov.fit_t_scaled dyjt_scaled ryjt_scaled
###   fit_yjt_scaled coef.fit_yjt_scaled logLik.fit_yjt_scaled
###   summary.fit_yjt_scaled vcov.fit_yjt_scaled bc_trafo bc_antitrafo
###   dbct_scaled rbct_scaled fit_bct_scaled coef.fit_bct_scaled
###   logLik.fit_bct_scaled summary.fit_bct_scaled vcov.fit_bct_scaled

### ** Examples

#############################################################################
# EXAMPLE 1: Transforming values according to Yeo-Johnson transformation
#############################################################################

# vector of y values
y <- seq(-3,3, len=100)

# non-negative lambda values
plot( y, mdmb::yj_trafo( y, lambda=1 ), type="l", ylim=8*c(-1,1),
           ylab=expression( g[lambda] (y) ) )
lines( y, mdmb::yj_trafo( y, lambda=2 ), lty=2 )
lines( y, mdmb::yj_trafo( y, lambda=.5 ), lty=3 )
lines( y, mdmb::yj_trafo( y, lambda=0 ), lty=4 )

# non-positive lambda values
plot( y, mdmb::yj_trafo( y, lambda=-1 ), type="l", ylim=8*c(-1,1),
           ylab=expression(g[lambda] (y) ) )
lines( y, mdmb::yj_trafo( y, lambda=-2 ), lty=2 )
lines( y, mdmb::yj_trafo( y, lambda=-.5 ), lty=3 )
lines( y, mdmb::yj_trafo( y, lambda=0 ), lty=4 )

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Density of scaled t distribution
##D #############################################################################
##D 
##D # define location and scale parameter
##D m0 <- 0.3
##D sig <- 1.5
##D #-- compare density of scaled t distribution with large degrees of freedom
##D #   with normal distribution
##D y1 <- mdmb::dt_scaled( y, location=m0, shape=sig, df=100 )
##D y2 <- stats::dnorm( y, mean=m0, sd=sig )
##D max(abs(y1-y2))
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulating and fitting the scaled t distribution
##D #############################################################################
##D 
##D #-- simulate data with 10 degrees of freedom
##D set.seed(987)
##D df0 <- 10    # define degrees of freedom
##D x <- mdmb::rt_scaled( n=1E4, location=m0, shape=sig, df=df0 )
##D #** fit data with df=10 degrees of freedom
##D fit1 <- mdmb::fit_t_scaled(x=x, df=df0 )
##D #** compare with fit from normal distribution
##D fit2 <- mdmb::fit_t_scaled(x=x, df=Inf )  # df=Inf is the default
##D 
##D #-- some comparisons
##D coef(fit1)
##D summary(fit1)
##D logLik(fit1)
##D AIC(fit1)
##D AIC(fit2)
##D 
##D #############################################################################
##D # EXAMPLE 4: Simulation and fitting of scaled t distribution with
##D #            Yeo-Johnson transformation
##D #############################################################################
##D 
##D # define parameters of transformed scaled t distribution
##D m0 <- .5
##D sig <- 1.5
##D lam <- .5
##D 
##D # evaluate density
##D x <- seq( -5, 5, len=100 )
##D y <- mdmb::dyjt_scaled( x, location=m0, shape=sig, lambda=lam )
##D graphics::plot( x, y, type="l")
##D 
##D # transform original values
##D mdmb::yj_trafo( y=x, lambda=lam )
##D 
##D #** simulate data
##D set.seed(987)
##D x <- mdmb::ryjt_scaled(n=3000, location=m0, shape=sig, lambda=lam )
##D graphics::hist(x, breaks=30)
##D 
##D #*** Model 1: Fit data with lambda to be estimated
##D fit1 <- mdmb::fit_yjt_scaled(x=x)
##D summary(fit1)
##D coef(fit1)
##D 
##D #*** Model 2: Fit data with lambda fixed to simulated lambda
##D fit2 <- mdmb::fit_yjt_scaled(x=x, lambda_fixed=lam)
##D summary(fit2)
##D coef(fit2)
##D 
##D #*** Model 3: Fit data with lambda fixed to 1
##D fit3 <- mdmb::fit_yjt_scaled(x=x, lambda_fixed=1)
##D 
##D #-- compare log-likelihood values
##D logLik(fit1)
##D logLik(fit2)
##D logLik(fit3)
##D 
##D #############################################################################
##D # EXAMPLE 5: Approximating the chi square distribution
##D #            with yjt and bct distribution
##D #############################################################################
##D 
##D #-- simulate data
##D set.seed(987)
##D n <- 3000
##D df0 <- 5
##D x <- stats::rchisq( n=n, df=df0 )
##D 
##D #-- plot data
##D graphics::hist(x, breaks=30)
##D 
##D #-- fit data with yjt distribution
##D fit1 <- mdmb::fit_yjt_scaled(x)
##D summary(fit1)
##D c1 <- coef(fit1)
##D 
##D #-- fit data with bct distribution
##D fit2 <- mdmb::fit_bct_scaled(x)
##D summary(fit2)
##D c2 <- coef(fit2)
##D # compare log-likelihood values
##D logLik(fit1)
##D logLik(fit2)
##D 
##D #-- plot chi square distribution and approximating yjt distribution
##D y <- seq( .01, 3*df0, len=100 )
##D dy <- stats::dchisq( y, df=df0 )
##D graphics::plot( y, dy, type="l", ylim=c(0, max(dy) )*1.1 )
##D # approximation with scaled t distribution and Yeo-Johnson transformation
##D graphics::lines( y, mdmb::dyjt_scaled(y, location=c1[1], shape=c1[2], lambda=c1[3]),
##D                      lty=2)
##D # approximation with scaled t distribution and Box-Cox transformation
##D graphocs::lines( y, mdmb::dbct_scaled(y, location=c2[1], shape=c2[2], lambda=c2[3]),
##D                      lty=3)
##D # appoximating normal distribution
##D graphics::lines( y, stats::dnorm( y, mean=df0, sd=sqrt(2*df0) ), lty=4)
##D graphics::legend( .6*max(y), .9*max(dy), c("chi square", "yjt", "bct", "norm"),
##D                      lty=1:4)
##D 
##D #############################################################################
##D # EXAMPLE 6: Bounded variable on (0,1) with Probit Yeo-Johnson transformation
##D #############################################################################
##D 
##D set.seed(876)
##D n <- 1000
##D x <- stats::rnorm(n)
##D y <- stats::pnorm( 1*x + stats::rnorm(n, sd=sqrt(.5) ) )
##D dat <- data.frame( y=y, x=x )
##D 
##D #*** fit Probit Yeo-Johnson distribution
##D mod1 <- mdmb::fit_yjt_scaled(x=y, probit=TRUE)
##D summary(mod1)
##D 
##D #*** estimation using regression model
##D mod2 <- mdmb::yjt_regression( y ~ x, data=dat, probit=TRUE )
##D summary(mod2)
## End(Not run)



