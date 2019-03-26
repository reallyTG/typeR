library(GERGM)


### Name: simulate_networks
### Title: A Function to simulate networks from a GERGM with given theta
###   parameters.
### Aliases: simulate_networks

### ** Examples

## Not run: 
##D set.seed(12345)
##D net <- matrix(runif(100),10,10)
##D diag(net) <- 0
##D colnames(net) <- rownames(net) <- letters[1:10]
##D formula <- net ~ edges + ttriads + in2stars
##D 
##D test <- simulate_networks(formula,
##D  thetas = c(0.6,-0.8),
##D  lambdas = 0.2,
##D  number_of_networks_to_simulate = 100,
##D  thin = 1/10,
##D  proposal_variance = 0.5,
##D  MCMC_burnin = 100,
##D  seed = 456)
##D 
##D # preferred method for specifying a null model
##D formula <- net ~ edges(method = "endogenous")
##D test <- simulate_networks(
##D  formula,
##D  thetas = 0,
##D  number_of_networks_to_simulate = 100,
##D  thin = 1/10,
##D  proposal_variance = 0.5,
##D  MCMC_burnin = 100,
##D  seed = 456)
##D  
## End(Not run)



