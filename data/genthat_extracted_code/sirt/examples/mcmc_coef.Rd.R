library(sirt)


### Name: mcmc_coef
### Title: Some Methods for Objects of Class 'mcmc.list'
### Aliases: mcmc_coef mcmc_vcov mcmc_confint mcmc_plot mcmc_summary
###   mcmc_derivedPars mcmc_WaldTest summary.mcmc_WaldTest

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Logistic regression in rcppbugs package
##D #############################################################################
##D 
##D 
##D #***************************************
##D # (1) simulate data
##D set.seed(8765)
##D N <- 500
##D x1 <- stats::rnorm(N)
##D x2 <- stats::rnorm(N)
##D y <- 1*( stats::plogis( -.6 + .7*x1 + 1.1 *x2 ) > stats::runif(N) )
##D 
##D #***************************************
##D # (2) estimate logistic regression with glm
##D mod <- stats::glm( y ~ x1 + x2, family="binomial" )
##D summary(mod)
##D 
##D #***************************************
##D # (3) estimate model with rcppbugs package
##D library(rcppbugs)
##D b <- rcppbugs::mcmc.normal( stats::rnorm(3),mu=0,tau=0.0001)
##D y.hat <- rcppbugs::deterministic( function(x1,x2,b){
##D                 stats::plogis( b[1] + b[2]*x1 + b[3]*x2 ) },
##D                   x1, x2, b)
##D y.lik <- rcppbugs::mcmc.bernoulli( y, p=y.hat, observed=TRUE)
##D model <- rcppbugs::create.model(b, y.hat, y.lik)
##D 
##D #*** estimate model in rcppbugs; 5000 iterations, 1000 burnin iterations
##D n.burnin <- 500 ; n.iter <- 2000 ; thin <- 2
##D ans <- rcppbugs::run.model(model, iterations=n.iter, burn=n.burnin, adapt=200, thin=thin)
##D print(rcppbugs::get.ar(ans)) # get acceptance rate
##D print(apply(ans[["b"]],2,mean)) # get means of posterior
##D 
##D #*** convert rcppbugs into mcmclist object
##D mcmcobj <- data.frame( ans$b )
##D colnames(mcmcobj) <- paste0("b",1:3)
##D mcmcobj <- as.matrix(mcmcobj)
##D class(mcmcobj) <- "mcmc"
##D attr(mcmcobj, "mcpar") <- c( n.burnin+1, n.iter, thin )
##D mcmcobj <- coda::mcmc( mcmcobj )
##D 
##D # coefficients, variance covariance matrix and confidence interval
##D mcmc_coef(mcmcobj)
##D mcmc_vcov(mcmcobj)
##D mcmc_confint( mcmcobj, level=.90 )
##D 
##D # summary and plot
##D mcmc_summary(mcmcobj)
##D mcmc_plot(mcmcobj, ask=TRUE)
##D 
##D # include derived parameters in mcmc object
##D derivedPars <- list( "diff12"=~ I(b2-b1), "diff13"=~ I(b3-b1) )
##D mcmcobj2 <- sirt::mcmc_derivedPars(mcmcobj, derivedPars=derivedPars )
##D mcmc_summary(mcmcobj2)
##D 
##D #*** Wald test for parameters
##D  # hyp1: b2 - 0.5=0
##D  # hyp2: b2 * b3=0
##D hypotheses <- list( "hyp1"=~ I( b2 - .5 ), "hyp2"=~ I( b2*b3 ) )
##D test1 <- sirt::mcmc_WaldTest( mcmcobj, hypotheses=hypotheses )
##D summary(test1)
## End(Not run)



