library(sirt)


### Name: mcmc.list.descriptives
### Title: Computation of Descriptive Statistics for a 'mcmc.list' Object
### Aliases: mcmc.list.descriptives

### ** Examples

## Not run: 
##D miceadds::library_install("coda")
##D miceadds::library_install("R2WinBUGS")
##D 
##D #############################################################################
##D # EXAMPLE 1: Logistic regression
##D #############################################################################
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
##D b <- rcppbugs::mcmc.normal( stats::rnorm(3),mu=0,tau=0.0001)
##D y.hat <- rcppbugs::deterministic(function(x1,x2,b) {
##D              stats::plogis( b[1] + b[2]*x1 + b[3]*x2 ) }, x1, x2, b)
##D y.lik <- rcppbugs::mcmc.bernoulli( y, p=y.hat, observed=TRUE)
##D m <- rcppbugs::create.model(b, y.hat, y.lik)
##D 
##D #*** estimate model in rcppbugs; 5000 iterations, 1000 burnin iterations
##D ans <- rcppbugs::run.model(m, iterations=5000, burn=1000, adapt=1000, thin=5)
##D print(rcppbugs::get.ar(ans))     # get acceptance rate
##D print(apply(ans[["b"]],2,mean))  # get means of posterior
##D 
##D #*** convert rcppbugs into mcmclist object
##D mcmcobj <- data.frame( ans$b  )
##D colnames(mcmcobj) <- paste0("b",1:3)
##D mcmcobj <- as.matrix(mcmcobj)
##D class(mcmcobj) <- "mcmc"
##D attr(mcmcobj, "mcpar") <- c( 1, nrow(mcmcobj), 1 )
##D mcmcobj <- coda::as.mcmc.list( mcmcobj )
##D 
##D # plot results
##D plot(mcmcobj)
##D 
##D # summary
##D summ1 <-  sirt::mcmc.list.descriptives( mcmcobj )
##D summ1
## End(Not run)



