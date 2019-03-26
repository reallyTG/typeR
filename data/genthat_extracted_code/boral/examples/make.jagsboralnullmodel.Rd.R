library(boral)


### Name: make.jagsboralnullmodel
### Title: Write a text file containing an boral model for use into JAGS
### Aliases: make.jagsboralnullmodel

### ** Examples

library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
n <- nrow(y)
p <- ncol(y)

## Create a boral "null" model JAGS script, where distributions alternative 
## between Poisson and negative distributions 
##   across the rows of y.
make.jagsboralnullmodel(family = rep(c("poisson","negative.binomial"),length=p), 
    num.X = ncol(spider$x), row.eff = "fixed", n = n, p = p)

     
## Create a boral "null" model JAGS script, where distributions are all negative 
## 	binomial distributions and covariates will be included!
make.jagsboralnullmodel(family = "negative.binomial", 
    num.X = ncol(spider$x), n = n, p = p, 
    model.name = "myawesomeordnullmodel.txt")

     
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
##D      n.thin = 1)
##D 
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", model.name = "anttraits.txt",
##D     mcmc.control = example_mcmc_control)
## End(Not run)



