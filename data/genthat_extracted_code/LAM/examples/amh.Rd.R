library(LAM)


### Name: amh
### Title: Bayesian Model Estimation with Adaptive Metropolis Hastings
###   Sampling ('amh') or Penalized Maximum Likelihood Estimation ('pmle')
### Aliases: amh summary.amh plot.amh logLik.amh coef.amh vcov.amh
###   confint.amh pmle summary.pmle plot.pmle logLik.pmle coef.pmle
###   vcov.pmle confint.pmle

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Constrained multivariate normal distribution
##D #############################################################################
##D 
##D #--- simulate data
##D Sigma <- matrix( c(
##D     1 , .55 , .5 ,
##D     .55 , 1 , .45 ,
##D     .5 , .45 , 1 ) , nrow=3 , ncol=3 , byrow=TRUE )
##D mu <- c(0,1,1.2)
##D N <- 400
##D set.seed(9875)
##D dat <- MASS::mvrnorm( N , mu , Sigma )
##D colnames(dat) <- paste0("Y",1:3)
##D S <- stats::cov(dat)
##D M <- colMeans(dat)
##D 
##D #-- define maximum likelihood function for normal distribution
##D fit_ml <- function( S , Sigma , M , mu , n , log=TRUE){
##D     Sigma1 <- solve(Sigma)
##D     p <- ncol(Sigma)
##D     det_Sigma <- det( Sigma )
##D     eps <- 1E-30
##D     if ( det_Sigma < eps ){
##D             det_Sigma <- eps
##D     }
##D     l1 <- - p * log( 2*pi ) - t( M - mu ) %*% Sigma1 %*% ( M - mu ) -
##D                   log( det_Sigma )  - sum( diag( Sigma1 %*% S ) )
##D     l1 <- n/2 * l1
##D     if (! log){
##D         l1 <- exp(l1)
##D     }
##D     l1 <- l1[1,1]
##D     return(l1)
##D }
##D # This likelihood function can be directly accessed by the loglike_mvnorm function.
##D 
##D #--- define data input
##D data <- list( "S" = S , "M" = M , "n" = N )
##D 
##D #--- define list of prior distributions
##D prior <- list()
##D prior[["mu1"]] <- list( "dnorm" , list( x=NA , mean=0 , sd=1 ) )
##D prior[["mu2"]] <- list( "dnorm" , list( x=NA , mean=0 , sd=5 ) )
##D prior[["sig1"]] <- list( "dunif" , list( x=NA , 0 , 10 ) )
##D prior[["rho"]] <- list( "dunif" , list( x=NA ,-1 , 1  ) )
##D 
##D #** alternatively, one can specify the prior as a string and uses
##D #   the 'prior_model_parse' function
##D prior_model2 <- "
##D    mu1 ~ dnorm(x=NA, mean=0, sd=1)
##D    mu2 ~ dnorm(x=NA, mean=0, sd=5)
##D    sig1 ~ dunif(x=NA, 0,10)
##D    rho ~ dunif(x=NA,-1,1)
##D    "
##D # convert string
##D prior2 <- sirt::prior_model_parse( prior_model2 )
##D prior2  # should be equal to prior
##D 
##D #--- define log likelihood function for model to be fitted
##D model <- function( pars , data ){
##D     # mean vector
##D     mu <- pars[ c("mu1", rep("mu2",2) ) ]
##D     # covariance matrix
##D     m1 <- matrix( pars["rho"] * pars["sig1"]^2 , 3 , 3 )
##D     diag(m1) <- rep( pars["sig1"]^2 , 3 )
##D     Sigma <- m1
##D     # evaluate log-likelihood
##D     ll <- fit_ml( S = data$S , Sigma = Sigma , M = data$M , mu = mu , n = data$n)
##D     return(ll)
##D }
##D 
##D #--- initial parameter values
##D pars <- c(1,2,2,0)
##D names(pars) <- c("mu1" , "mu2" , "sig1" , "rho")
##D #--- initial proposal distributions
##D proposal_sd <- c( .4 , .1 , .05 , .1 )
##D names(proposal_sd) <- names(pars)
##D #--- lower and upper bound for parameters
##D pars_lower <- c( -10 , -10 , .001 , -.999 )
##D pars_upper <- c( 10 , 10 , 1E100 , .999 )
##D 
##D #--- define list with derived parameters
##D derivedPars <- list( "var1" = ~ I( sig1^2 ) , "d1" = ~ I( ( mu2 - mu1 ) / sig1 ) )
##D 
##D #*** start Metropolis-Hastings sampling
##D mod <- LAM::amh( data , nobs = data$n , pars=pars , model=model ,
##D           prior=prior , proposal_sd = proposal_sd ,
##D           n.iter = 1000 , n.burnin = 300 , derivedPars = derivedPars ,
##D           pars_lower = pars_lower , pars_upper = pars_upper )
##D 
##D # some S3 methods
##D summary(mod)
##D plot(mod, ask=TRUE)
##D coef(mod)
##D vcov(mod)
##D logLik(mod)
##D 
##D #--- compare Bayesian credibility intervals and HPD intervals
##D ci <- cbind( confint(mod) , coda::HPDinterval(mod$mcmcobj)[-1, ] )
##D ci
##D # interval lengths
##D cbind( ci[,2]-ci[,1] , ci[,4] - ci[,3] )
##D 
##D #--- plot update history of proposal standard deviations
##D graphics::matplot( x = rownames(mod$proposal_sd_history) ,
##D           y = mod$proposal_sd_history , type="o" , pch=1:6)
##D 
##D #**** compare results with lavaan package
##D library(lavaan)
##D lavmodel <- "
##D     F=~ 1*Y1 + 1*Y2 + 1*Y3
##D     F ~~ rho*F
##D     Y1 ~~ v1*Y1
##D     Y2 ~~ v1*Y2
##D     Y3 ~~ v1*Y3
##D     Y1 ~ mu1 * 1
##D     Y2 ~ mu2 * 1
##D     Y3 ~ mu2 * 1
##D     # total standard deviation
##D     sig1 := sqrt( rho + v1 )
##D     "
##D # estimate model
##D mod2 <- lavaan::sem( data = as.data.frame(dat) , lavmodel )
##D summary(mod2)
##D logLik(mod2)
##D 
##D #*** compare results with penalized maximum likelihood estimation
##D mod3 <- LAM::pmle( data=data , nobs= data$n , pars=pars , model = model ,  prior=prior ,
##D             pars_lower = pars_lower , pars_upper = pars_upper, verbose=TRUE  )
##D # model summaries
##D summary(mod3)
##D confint(mod3)
##D vcov(mod3)
##D 
##D #*** penalized likelihood estimation with provided gradient of log-likelihood
##D 
##D library(CDM)
##D fct <- function(x){
##D     model(pars=x, data=data )
##D }
##D # use numerical gradient (just for illustration)
##D grad <- function(pars){
##D     CDM::numerical_Hessian(par=pars, FUN=fct, gradient = TRUE, hessian = FALSE)
##D }
##D #- estimate model
##D mod3b <- LAM::pmle( data=data, nobs= data$n, pars=pars, model=model,  prior=prior, model_grad=grad,
##D             pars_lower = pars_lower , pars_upper = pars_upper, verbose = TRUE  )
##D summary(mod3b)
##D 
##D #--- lavaan with covariance and mean vector input
##D mod2a <- lavaan::sem( sample.cov = data$S , sample.mean = data$M , sample.nobs = data$n ,
##D                 model = lavmodel )
##D coef(mod2)
##D coef(mod2a)
##D 
##D #--- fit covariance and mean structure by fitting a transformed
##D #    covariance structure
##D #* create an expanded covariance matrix
##D p <- ncol(S)
##D S1 <- matrix( NA , nrow= p+1 , ncol=p+1 )
##D S1[1:p,1:p] <- S + outer( M , M )
##D S1[p+1,1:p] <- S1[1:p , p+1] <- M
##D S1[p+1,p+1] <- 1
##D vars <- c( colnames(S) , "MY" )
##D rownames(S1) <- colnames(S1) <- vars
##D #* lavaan model
##D lavmodel <- "
##D     # indicators
##D     F=~ 1*Y1 + 1*Y2 + 1*Y3
##D     # pseudo-indicator representing mean structure
##D     FM =~ 1*MY
##D     MY ~~ 0*MY
##D     FM ~~ 1*FM
##D     F ~~ 0*FM
##D     # mean structure
##D     FM =~ mu1*Y1 + mu2*Y2 + mu2*Y3
##D     # variance structure
##D     F ~~ rho*F
##D     Y1 ~~ v1*Y1
##D     Y2 ~~ v1*Y2
##D     Y3 ~~ v1*Y3
##D     sig1 := sqrt( rho + v1 )
##D     "
##D 
##D # estimate model
##D mod2b <- lavaan::sem( sample.cov = S1 ,sample.nobs = data$n ,
##D                 model = lavmodel )
##D summary(mod2b)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Estimation of a linear model with Box-Cox transformation of response
##D #############################################################################
##D 
##D #*** simulate data with Box-Cox transformation
##D set.seed(875)
##D N <- 1000
##D b0 <- 1.5
##D b1 <- .3
##D sigma <- .5
##D lambda <- 0.3
##D # apply inverse Box-Cox transformation
##D   # yl = ( y^lambda - 1 ) / lambda
##D   # -> y = ( lambda * yl + 1 )^(1/lambda)
##D x <- stats::rnorm( N ,  mean=0 , sd = 1 )
##D yl <- stats::rnorm( N , mean=b0 , sd = sigma ) + b1*x
##D # truncate at zero
##D eps <- .01
##D yl <- ifelse( yl < eps  , eps , yl )
##D y <- ( lambda * yl + 1 ) ^(1/lambda )
##D 
##D #-- display distributions of transformed and untransformed data
##D    graphics::par(mfrow=c(1,2))
##D graphics::hist(yl, breaks=20)
##D graphics::hist(y, breaks=20)
##D    graphics::par(mfrow=c(1,1))
##D 
##D #*** define vector of parameters
##D pars <- c( 0  , 0 ,  1 , -.2 )
##D names(pars) <- c("b0" , "b1" , "sigma" , "lambda" )
##D #*** input data
##D data <- list( "y" = y , "x" = x)
##D #*** define model with log-likelihood function
##D model <- function( pars , data ){
##D     sigma <- pars["sigma"]
##D     b0 <- pars["b0"]
##D     b1 <- pars["b1"]
##D     lambda <- pars["lambda"]
##D     if ( abs(lambda) < .01){ lambda <- .01 * sign(lambda) }
##D     y <- data$y
##D     x <- data$x
##D     n <- length(y)
##D     y_lambda <- ( y^lambda - 1 ) / lambda
##D     ll <- - n/2 * log(2*pi) - n * log( sigma ) -
##D             1/(2*sigma^2)* sum( (y_lambda - b0 - b1*x)^2 ) +
##D             ( lambda - 1 ) * sum( log( y ) )
##D     return(ll)
##D }
##D #-- test model function
##D model( pars , data )
##D 
##D #*** define prior distributions
##D prior <- list()
##D prior[["b0"]] <- list( "dnorm" , list( x=NA , mean=0 , sd=10 ) )
##D prior[["b1"]] <- list( "dnorm" , list( x=NA , mean=0 , sd=10 ) )
##D prior[["sigma"]] <- list( "dunif" , list( x=NA , 0 , 10  ) )
##D prior[["lambda"]] <- list( "dunif" , list( x=NA , -2 , 2 ) )
##D #*** define proposal SDs
##D proposal_sd <- c( .1 , .1 , .1 , .1 )
##D names(proposal_sd) <- names(pars)
##D #*** define bounds for parameters
##D pars_lower <- c( -100 , -100 , .01 , -2 )
##D pars_upper <- c( 100 , 100 , 100 , 2 )
##D 
##D #*** sampling routine
##D mod <- LAM::amh( data , nobs = N , pars , model ,  prior , proposal_sd ,
##D         n.iter = 10000 , n.burnin = 2000 , n.sims = 5000 ,
##D         pars_lower = pars_lower , pars_upper = pars_upper )
##D #-- S3 methods
##D summary(mod)
##D plot(mod , ask=TRUE )
##D 
##D #*** estimating Box-Cox transformation in MASS package
##D library(MASS)
##D mod2 <- MASS::boxcox( stats::lm( y ~ x ) , lambda = seq(-1,2,length=100) )
##D mod2$x[ which.max( mod2$y ) ]
##D 
##D #*** estimate Box-Cox parameter lambda with car package
##D library(car)
##D mod3 <- car::powerTransform( y ~ x )
##D summary(mod3)
##D # fit linear model with transformed response
##D mod3a <- stats::lm( car::bcPower( y, mod3$roundlam) ~ x )
##D summary(mod3a)
##D 
##D #############################################################################
##D # EXAMPLE 3: STARTS model directly specified in LAM or lavaan
##D #############################################################################
##D 
##D ## Data from Wu (2016)
##D 
##D library(LAM)
##D library(sirt)
##D library(STARTS)
##D 
##D ## define list with input data
##D ## S ... covariance matrix, M ... mean vector
##D 
##D # read covariance matrix of data in Wu (older cohort, positive affect)
##D S <- matrix( c( 12.745, 7.046, 6.906, 6.070, 5.047, 6.110,
##D     7.046, 14.977, 8.334, 6.714, 6.91, 6.624,
##D     6.906, 8.334, 13.323, 7.979, 8.418, 7.951,
##D     6.070, 6.714, 7.979, 12.041, 7.874, 8.099,
##D     5.047, 6.91, 8.418, 7.874, 13.838, 9.117,
##D     6.110, 6.624, 7.951, 8.099, 9.117, 15.132 ) ,
##D     nrow=6 , ncol=6 , byrow=TRUE )
##D #* standardize S such that the average SD is 1 (for ease of interpretation)
##D M_SD <- mean( sqrt( diag(S) ))
##D S <- S / M_SD^2
##D colnames(S) <- rownames(S) <- paste0("W",1:6)
##D W <- 6   # number of measurement waves
##D data <- list( "S" = S , "M" = rep(0,W) , "n" = 660 , "W" = W  )
##D 
##D #*** likelihood function for the STARTS model
##D model <- function( pars , data ){
##D     # mean vector
##D     mu <- data$M
##D     # covariance matrix
##D     W <- data$W
##D     var_trait <- pars["vt"]
##D     var_ar <- pars["va"]
##D     var_state <- pars["vs"]
##D     a <- pars["b"]
##D     Sigma <- STARTS::starts_uni_cov( W=W , var_trait=var_trait ,
##D                 var_ar=var_ar , var_state=var_state , a=a )
##D     # evaluate log-likelihood
##D     ll <- LAM::loglike_mvnorm( S = data$S , Sigma = Sigma , M = data$M , mu = mu ,
##D                 n = data$n , lambda = 1E-5)
##D     return(ll)
##D }
##D #** Note:
##D #   (1) The function starts_uni_cov calculates the model implied covariance matrix
##D #       for the STARTS model.
##D #   (2) The function loglike_mvnorm evaluates the loglikelihood for a multivariate
##D #       normal distribution given sample and population means M and mu, and sample
##D #       and population covariance matrix S and Sigma.
##D 
##D #*** starting values for parameters
##D pars <- c( .33 , .33 , .33 , .75)
##D names(pars) <- c("vt","va","vs","b")
##D #*** bounds for acceptance rates
##D acceptance_bounds <- c( .45 , .55 )
##D #*** starting values for proposal standard deviations
##D proposal_sd <- c( .1 , .1 , .1 , .1 )
##D names(proposal_sd) <- names(pars)
##D #*** lower and upper bounds for parameter estimates
##D pars_lower <- c( .001 , .001 , .001 , .001 )
##D pars_upper <- c( 10 , 10 , 10 , .999 )
##D #*** define prior distributions | use prior sample size of 3
##D prior_model <- "
##D     vt ~ dinvgamma2(NA, 3, .33 )
##D     va ~ dinvgamma2(NA, 3, .33 )
##D     vs ~ dinvgamma2(NA, 3, .33 )
##D     b ~ dbeta(NA, 4, 4 )
##D         "
##D #*** define number of iterations
##D n.burnin <- 5000
##D n.iter <- 20000
##D set.seed(987)    # fix random seed
##D #*** estimate model with 'LAM::amh' function
##D mod <- LAM::amh( data=data, nobs=data$n, pars=pars, model=model,
##D             prior=prior_model, proposal_sd=proposal_sd, n.iter=n.iter,
##D             n.burnin=n.burnin, pars_lower=pars_lower, pars_upper=pars_upper)
##D #*** model summary
##D summary(mod)
##D   ##  Parameter Summary (Marginal MAP estimation)
##D   ##    parameter   MAP    SD  Q2.5 Q97.5  Rhat SERatio effSize accrate
##D   ##  1        vt 0.352 0.088 0.122 0.449 1.014   0.088     128   0.557
##D   ##  2        va 0.335 0.080 0.238 0.542 1.015   0.090     123   0.546
##D   ##  3        vs 0.341 0.018 0.297 0.367 1.005   0.042     571   0.529
##D   ##  4         b 0.834 0.065 0.652 0.895 1.017   0.079     161   0.522
##D   ##
##D   ##  Comparison of Different Estimators
##D   ##
##D   ##  MAP: Univariate marginal MAP estimation
##D   ##  mMAP: Multivariate MAP estimation (penalized likelihood estimate)
##D   ##  Mean: Mean of posterior distributions
##D   ##
##D   ##    Parameter Summary:
##D   ##    parm   MAP  mMAP  Mean
##D   ##  1   vt 0.352 0.294 0.300
##D   ##  2   va 0.335 0.371 0.369
##D   ##  3   vs 0.341 0.339 0.335
##D   ##  4    b 0.834 0.822 0.800
##D 
##D #* inspect convergence
##D plot(mod, ask=TRUE)
##D 
##D #---------------------------
##D # fitting the STARTS model with penalized maximum likelihood estimation
##D mod2 <- LAM::pmle( data=data , nobs= data$n , pars=pars , model = model ,  prior=prior_model ,
##D             pars_lower = pars_lower , pars_upper = pars_upper , method = "L-BFGS-B" ,
##D             control=list( trace=TRUE )  )
##D # model summaries
##D summary(mod2)
##D   ##  Parameter Summary
##D   ##    parameter   est    se      t     p active
##D   ##  1        vt 0.298 0.110  2.712 0.007      1
##D   ##  2        va 0.364 0.102  3.560 0.000      1
##D   ##  3        vs 0.337 0.018 18.746 0.000      1
##D   ##  4         b 0.818 0.074 11.118 0.000      1
##D 
##D #---------------------------
##D # fitting the STARTS model in lavaan
##D 
##D library(lavaan)
##D 
##D ## define lavaan model
##D lavmodel <- "
##D      #*** stable trait
##D      T =~ 1*W1 + 1*W2 + 1*W3 + 1*W4 + 1*W5 + 1*W6
##D      T ~~ vt * T
##D      W1 ~~ 0*W1
##D      W2 ~~ 0*W2
##D      W3 ~~ 0*W3
##D      W4 ~~ 0*W4
##D      W5 ~~ 0*W5
##D      W6 ~~ 0*W6
##D      #*** autoregressive trait
##D      AR1 =~ 1*W1
##D      AR2 =~ 1*W2
##D      AR3 =~ 1*W3
##D      AR4 =~ 1*W4
##D      AR5 =~ 1*W5
##D      AR6 =~ 1*W6
##D      #*** state component
##D      S1 =~ 1*W1
##D      S2 =~ 1*W2
##D      S3 =~ 1*W3
##D      S4 =~ 1*W4
##D      S5 =~ 1*W5
##D      S6 =~ 1*W6
##D      S1 ~~ vs * S1
##D      S2 ~~ vs * S2
##D      S3 ~~ vs * S3
##D      S4 ~~ vs * S4
##D      S5 ~~ vs * S5
##D      S6 ~~ vs * S6
##D      AR2 ~ b * AR1
##D      AR3 ~ b * AR2
##D      AR4 ~ b * AR3
##D      AR5 ~ b * AR4
##D      AR6 ~ b * AR5
##D      AR1 ~~ va * AR1
##D      AR2 ~~ v1 * AR2
##D      AR3 ~~ v1 * AR3
##D      AR4 ~~ v1 * AR4
##D      AR5 ~~ v1 * AR5
##D      AR6 ~~ v1 * AR6
##D      #*** nonlinear constraint
##D      v1 == va * ( 1 - b^2 )
##D      #*** force variances to be positive
##D      vt > 0.001
##D      va > 0.001
##D      vs > 0.001
##D      #*** variance proportions
##D      var_total := vt + vs + va
##D      propt := vt / var_total
##D      propa := va / var_total
##D      props := vs / var_total
##D     "
##D # estimate lavaan model
##D mod <- lavaan::lavaan(model = lavmodel, sample.cov = S, sample.nobs = 660)
##D # summary and fit measures
##D summary(mod)
##D lavaan::fitMeasures(mod)
##D coef(mod)[ ! duplicated( names(coef(mod))) ]
##D   ##           vt          vs           b          va          v1
##D   ##  0.001000023 0.349754630 0.916789054 0.651723144 0.103948711
## End(Not run)



