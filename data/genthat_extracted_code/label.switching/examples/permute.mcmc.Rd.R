library(label.switching)


### Name: permute.mcmc
### Title: Reorder MCMC samples
### Aliases: permute.mcmc

### ** Examples

#load MCMC simulated data
data("mcmc_output")
mcmc.pars<-data_list$"mcmc.pars"
z<-data_list$"z"
K<-data_list$"K"

#apply \code{ecr.iterative.1} algorithm
run<-ecr.iterative.1(z = z, K = 2)
#reorder the MCMC output according to this method:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the two components
# reordered.mcmc[,,2]: reordered variances of the components
# reordered.mcmc[,,3]: reordered weights of the two components



