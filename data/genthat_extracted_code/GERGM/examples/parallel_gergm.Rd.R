library(GERGM)


### Name: parallel_gergm
### Title: A Function to estimate a number of GERGMs in parallel, each with
###   its own equation.
### Aliases: parallel_gergm

### ** Examples

## Not run: 
##D set.seed(12345)
##D net <- matrix(runif(100,0,1),10,10)
##D colnames(net) <- rownames(net) <- letters[1:10]
##D node_level_covariates <- data.frame(Age = c(25,30,34,27,36,39,27,28,35,40),
##D                            Height = c(70,70,67,58,65,67,64,74,76,80),
##D                            Type = c("A","B","B","A","A","A","B","B","C","C"))
##D rownames(node_level_covariates) <- letters[1:10]
##D network_covariate <- net + matrix(rnorm(100,0,.5),10,10)
##D 
##D network_data_list <- list(network_covariate = network_covariate)
##D 
##D formula <- net ~ edges + sender("Age") +
##D   netcov("network_covariate") + nodematch("Type",base = "A")
##D formula2 <- net ~ edges +
##D   netcov("network_covariate") + nodemix("Type",base = "A")
##D 
##D form_list <- list(f1 = formula,
##D                   f2 = formula2)
##D 
##D testl <- parallel_gergm(formula_list = form_list,
##D                         observed_network_list = net,
##D                         covariate_data_list = node_level_covariates,
##D                         network_data_list = network_data_list,
##D                         cores = 2,
##D                         number_of_networks_to_simulate = 10000,
##D                         thin = 1/100,
##D                         proposal_variance = 0.1,
##D                         MCMC_burnin = 5000)
## End(Not run)



