library(emIRT)


### Name: ordIRT
### Title: Two-parameter Ordinal IRT estimation via EM
### Aliases: ordIRT
### Keywords: multivariate

### ** Examples


## Not run: 
##D ### Real data example: Asahi-Todai survey (not run)
##D ## Collapses 5-category ordinal survey items into 3 categories for estimation
##D data(AsahiTodai)
##D out.varinf <- ordIRT(.rc = AsahiTodai$dat.all, .starts = AsahiTodai$start.values,
##D 					.priors = AsahiTodai$priors, .D = 1,
##D 					.control = {list(verbose = TRUE,
##D                      thresh = 1e-6, maxit = 500)})
##D 
##D ## Compare against MCMC estimates using 3 and 5 categories
##D cor(ideal3, out.varinf$means$x)
##D cor(ideal5, out.varinf$means$x)  
## End(Not run)


### Monte Carlo simulation of ordIRT() model vs. known parameters
## Set number of legislators and items
set.seed(2)
NN <- 500
JJ <- 100

## Simulate true parameters from original model
x.true <- runif(NN, -2, 2)
beta.true <- runif(JJ, -1, 1)
tau1 <- runif(JJ, -1.5, -0.5)
tau2 <- runif(JJ, 0.5, 1.5)
ystar <- x.true %o% beta.true + rnorm(NN *JJ)

## These parameters are not needed, but correspond to reparameterized model
#d.true <- tau2 - tau1
#dd.true <- d.true^2
#tau_star <- -tau1/d.true
#beta_star <- beta.true/d.true

## Generate roll call matrix using simulated parameters
newrc <- matrix(0, NN, JJ)
for(j in 1:JJ) newrc[,j] <- cut(ystar[,j], c(-100, tau1[j], tau2[j],100), labels=FALSE)

## Generate starts and priors
cur <- vector(mode = "list")
cur$DD <- matrix(rep(0.5,JJ), ncol=1)
cur$tau <- matrix(rep(-0.5,JJ), ncol=1)
cur$beta <- matrix(runif(JJ,-1,1), ncol=1) 
cur$x <- matrix(runif(NN,-1,1), ncol=1) 
priors <- vector(mode = "list")
priors$x <- list(mu = matrix(0,1,1), sigma = matrix(1,1,1) )
priors$beta <- list(mu = matrix(0,2,1), sigma = matrix(diag(25,2),2,2))

## Call ordIRT() with inputs
time <- system.time({
    lout <- ordIRT(.rc = newrc,
                    .starts = cur,
                    .priors = priors,
                    .control = {list(
                        threads = 1,
                        verbose = TRUE,
                        thresh = 1e-6,
			maxit=300,
			checkfreq=50
                        )})
})

## Examine runtime and correlation of recovered ideal points vs. truth
time
cor(x.true,lout$means$x)




