library(boral)


### Name: make.jagsboralmodel
### Title: Write a text file containing an boral model for use into JAGS
### Aliases: make.jagsboralmodel

### ** Examples

library(mvtnorm)
library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
n <- nrow(y)
p <- ncol(y)

## Example 1 - Create a boral model JAGS script, where distributions alternative 
## between Poisson and negative binomial distributions 
##   across the rows of y.
make.jagsboralmodel(family = rep(c("poisson","negative.binomial"),length=p), 
    row.eff = "fixed", num.X = 0, n = n, p = p)

## Example 2 - Create a boral model JAGS script, where distributions are all 
##	negative binomial distributions and covariates will be included.
make.jagsboralmodel(family = "negative.binomial", num.X = ncol(spider$x),
    n = n, p = p)

	
## Example 3 - Simulate some ordinal data and create a JAGS model script
## 30 rows (sites) with two latent variables 
true.lv <- rbind(rmvnorm(15,mean=c(-2,-2)),rmvnorm(15,mean=c(2,2)))
## 10 columns (species)
true.lv.coefs <- rmvnorm(10,mean = rep(0,3)); 
true.lv.coefs[nrow(true.lv.coefs),1] <- -sum(true.lv.coefs[-nrow(true.lv.coefs),1])
## Impose a sum-to-zero constraint on the column effects
true.ordinal.cutoffs <- seq(-2,10,length=10-1)

simy <- create.life(true.lv = true.lv, lv.coefs = true.lv.coefs, 
    family = "ordinal", cutoffs = true.ordinal.cutoffs) 

make.jagsboralmodel(family = "ordinal", num.X = 0, 
    row.eff = FALSE, n=30, p=10, model.name = "myawesomeordmodel.txt")


## Have a look at the JAGS model file for a boral model involving traits,
## based on the ants data from mvabund.
library(mvabund)
data(antTraits)

y <- antTraits$abun
X <- as.matrix(antTraits$env)
## Include only traits 1, 2, and 5, plus an intercept
traits <- as.matrix(antTraits$traits[,c(1,2,5)])
## Please see help file for boral regarding the use of which.traits
example_which_traits <- vector("list",ncol(X)+1)
for(i in 1:length(example_which_traits)) 
    example_which_traits[[i]] <- 1:ncol(traits)

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D     n.thin = 1)
##D 
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", lv.control = list(num.lv = 2),
##D     model.name = "anttraits.txt", mcmc.control = example_mcmc_control)
## End(Not run)




