library(boral)


### Name: create.life
### Title: Simulate a Multivariate Response Matrix
### Aliases: create.life simulate.boral

### ** Examples

## NOTE: The values below MUST NOT be used in a real application;
## they are only used here to make the examples run quick!!!
example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
     n.thin = 1)

## Example 1a - Simulate a response matrix of normally distributed data
library(mvtnorm)

## 30 rows (sites) with two latent variables 
true.lv <- rbind(rmvnorm(n=15,mean=c(1,2)),rmvnorm(n=15,mean=c(-3,-1))) 
## 30 columns (species)
lv.coefs <- cbind(matrix(runif(30*3),30,3),1)

X <- matrix(rnorm(30*4),30,4) 
## 4 explanatory variables
X.coefs <- matrix(rnorm(30*4),30,4)

simy <- create.life(true.lv = true.lv, lv.coefs = lv.coefs, 
    X = X, X.coefs = X.coefs, family = "normal")

## Not run: 
##D fit.boral <- boral(simy, X = X, family = "normal", lv.control = list(num.lv = 2),
##D     mcmc.control = example_mcmc_control)
##D 
##D summary(fit.boral)
## End(Not run)

## Example 1b - Include a nested random row effect
## 30 subregions nested within six regions
example_row_ids <- cbind(1:30, rep(1:6,each=5))
## Subregion has a small std deviation; region has a larger one
true.row.sigma <- list(ID1 = 0.5, ID2 = 2)

simy <- create.life(true.lv = true.lv, lv.coefs = lv.coefs, 
    X = X, X.coefs = X.coefs, row.eff = "random",
    row.params = true.row.sigma, row.ids = example_row_ids, family = "normal",
    save.params = TRUE)

	
## Example 1c - Same as example 1b except new, true latent variables are generated
simy <- create.life(true.lv = NULL, lv.coefs = lv.coefs, 
    X = X, X.coefs = X.coefs, row.eff = "random",
    row.params = true.row.sigma, row.ids = example_row_ids, family = "normal",
    save.params = TRUE)

    
## Example 1d - Same as example 1a except new, true latent variables are generated
## with a non-independent correlation structure using a fake distance matrix
makedistmat <- as.matrix(dist(1:30))
simy <- create.life(true.lv = NULL, lv.coefs = lv.coefs, 
    lv.control = list(num.lv = 2, type = "exponential", lv.covparams = 5, distmat = makedistmat),
    X = X, X.coefs = X.coefs, row.eff = "random",
    row.params = true.row.sigma, row.ids = example_row_ids, family = "normal",
    save.params = TRUE)

    
## Example 2 - Simulate a response matrix of ordinal data
## 30 rows (sites) with two latent variables 
true.lv <- rbind(rmvnorm(15,mean=c(-2,-2)),rmvnorm(15,mean=c(2,2)))
## 10 columns (species)
true.lv.coefs <- rmvnorm(10,mean = rep(0,3)); 
## Cutoffs for proportional odds regression (must be in increasing order)
true.ordinal.cutoffs <- seq(-2,10,length=10-1)

simy <- create.life(true.lv = true.lv, lv.coefs = true.lv.coefs, 
     family = "ordinal", cutoffs = true.ordinal.cutoffs, save.params = TRUE) 

## Not run: 
##D fit.boral <- boral(y = simy$resp, family = "ordinal", lv.control = list(num.lv = 2),
##D       mcmc.control = example_mcmc_control)
## End(Not run)

## Not run: 
##D ## Example 3 - Simulate a response matrix of count data based off
##D ## a fitted boral model involving traits (ants data from mvabund)
##D library(mvabund)
##D data(antTraits)
##D 
##D y <- antTraits$abun
##D X <- as.matrix(antTraits$env)
##D ## Include only traits 1, 2, and 5, plus an intercept
##D traits <- as.matrix(antTraits$traits[,c(1,2,5)])
##D ## Please see help file for boral regarding the use of which.traits
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D      example_which_traits[[i]] <- 1:ncol(traits)
##D 
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", lv.control = list(num.lv = 2),
##D      mcmc.control = example_mcmc_control)
##D 
##D ## The hard way
##D simy <- create.life(true.lv = fit_traits$lv.mean, 
##D      lv.coefs = fit_traits$lv.coefs.median, X = X, 
##D      X.coefs = fit_traits$X.coefs.median, traits = traits, 
##D      traits.coefs = fit_traits$traits.coefs.median, family = "negative.binomial")
##D 
##D ## The easy way, using the same latent variables as the fitted boral model
##D simy <- simulate(object = fit_traits)
##D 
##D ## The easy way, generating new latent variables
##D simy <- simulate(object = fit_traits, new.lvs = TRUE)
## End(Not run)


## Example 4 - simulate Bernoulli data, based on a model with two latent variables, 
## no site variables, with two traits and one environmental covariates 
## This example is a proof of concept that traits can used 
## to explain environmental responses 
library(mvtnorm)

n <- 100; s <- 50
X <- as.matrix(scale(1:n))
colnames(X) <- c("elevation")

traits <- cbind(rbinom(s,1,0.5), rnorm(s)) 
## one categorical and one continuous variable
colnames(traits) <- c("thorns-dummy","SLA")

simfit <- list(lv.coefs = cbind(rnorm(s), rmvnorm(s, mean = rep(0,2))), 
     lv.control = list(num.lv = 2, type = "independent"),
    traits.coefs = matrix(c(0.1,1,-0.5,1,0.5,0,-1,1), 2, byrow = TRUE))
rownames(simfit$traits.coefs) <- c("beta0","elevation")
colnames(simfit$traits.coefs) <- c("kappa0","thorns-dummy","SLA","sigma")

simy <- create.life(lv.control = simfit$lv.control, lv.coefs = simfit$lv.coefs, 
    X = X, traits = traits, traits.coefs = simfit$traits.coefs, 
    family = "binomial") 


## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D     n.thin = 1)
##D 
##D example_which_traits <- vector("list",ncol(X)+1); 
##D for(i in 1:length(example_which_traits)) 
##D     example_which_traits[[i]] <- 1:ncol(traits)
##D fit_traits <- boral(y = simy, X = X, traits = traits, 
##D     which.traits = example_which_traits, family = "binomial", 
##D     lv.control = list(num.lv = 2), save.model = TRUE, 
##D     mcmc.control = example_mcmc_control)
## End(Not run)




