library(label.switching)


### Name: ecr.iterative.1
### Title: ECR algorithm (iterative version 1)
### Aliases: ecr.iterative.1

### ** Examples

#load a toy example: MCMC output consists of the random beta model
# applied to a normal mixture of \code{K=2} components. The number of
# observations is equal to \code{n=5}. The number of MCMC samples is
# equal to \code{m=1000}. The 300 simulated allocations are stored to
# array \code{z}. 
data("mcmc_output")
# mcmc parameters are stored to array \code{mcmc.pars}
mcmc.pars<-data_list$"mcmc.pars"
z<-data_list$"z"
K<-data_list$"K"
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances 
# mcmc.pars[,,3]: simulated weights
# the relabelling algorithm will run with the default initialization
# (no opt_init is specified)
run<-ecr.iterative.1(z = z, K = K)
# apply the permutations returned by typing:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the two components
# reordered.mcmc[,,2]: reordered variances
# reordered.mcmc[,,3]: reordered weights



