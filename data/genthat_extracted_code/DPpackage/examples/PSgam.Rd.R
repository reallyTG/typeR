library(DPpackage)


### Name: PSgam
### Title: Bayesian analysis for a semiparametric generalized additive
###   model
### Aliases: PSgam PSgam.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D  # Normal simulated data
##D    set.seed(0)
##D    n <- 400
##D    sig <- 2
##D    x0 <- runif(n, 0, 1)
##D    x1 <- runif(n, 0, 1)
##D    x2 <- runif(n, 0, 1)
##D    x3 <- runif(n, 0, 1)
##D    f0 <- function(x) 2 * sin(pi * x)
##D    f1 <- function(x) exp(2 * x)
##D    f2 <- function(x) 0.2*x^11*(10*(1-x))^6+10*(10*x)^3*(1-x)^10
##D    f3 <- function(x) 0*x
##D    f <- f0(x0) + f1(x1) + f2(x2)
##D    e <- rnorm(n, 0, sig)
##D    y <- f + e
##D 
##D  # prior
##D    prior <- list(taub1=2.02,
##D                  taub2=0.02,
##D                  beta0=rep(0,1),
##D                  Sbeta0=diag(100,1),
##D                  tau1=6.01,
##D                  tau2=2.01)
##D 
##D   # Initial state
##D     state <- NULL
##D 
##D   # MCMC parameters
##D     nburn <- 5000
##D     nsave <- 5000
##D     nskip <- 0
##D     ndisplay <- 100
##D     mcmc <- list(nburn=nburn,
##D                  nsave=nsave,
##D                  nskip=nskip,
##D                  ndisplay=ndisplay)
##D 
##D 
##D   # fitting the model
##D     fit1 <- PSgam(formula=y~ps(x0,x1,x2,x3,k=20,degree=3,pord=1),
##D                   family=gaussian(),prior=prior,
##D                   mcmc=mcmc,ngrid=30,
##D                   state=state,status=TRUE)
##D 
##D 
##D   # A binary example 
##D     g <- (f-5)/3
##D     g <- binomial()$linkinv(g)
##D     y <- rbinom(n,1,g)
##D 
##D   # fitting the model
##D     fit2 <- PSgam(formula=y~ps(x0,x1,x2,x3,k=20,degree=3,pord=1),
##D                   family=binomial(logit),prior=prior,
##D                   mcmc=mcmc,ngrid=30,
##D                   state=state,status=TRUE)
##D 
##D   # Poisson data
##D     g <- exp(f/4)
##D     y <- rpois(n,g)
##D 
##D   # fitting the model
##D     fit3 <- PSgam(formula=y~ps(x0,x1,x2,x3,k=20,degree=3,pord=1),
##D                   family=poisson(log),prior=prior,
##D                   mcmc=mcmc,ngrid=30,
##D                   state=state,status=TRUE)
## End(Not run)



