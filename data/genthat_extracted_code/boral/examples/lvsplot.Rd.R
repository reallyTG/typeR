library(boral)


### Name: lvsplot
### Title: Plot the latent variables from an boral model
### Aliases: lvsplot

### ** Examples

## NOTE: The values below MUST NOT be used in a real application;
## they are only used here to make the examples run quick!!!
example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
     n.thin = 1)

library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
n <- nrow(y)
p <- ncol(y)
     
spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2),
    row.eff = "fixed", mcmc.control = example_mcmc_control)

lvsplot(spiderfit_nb) 



