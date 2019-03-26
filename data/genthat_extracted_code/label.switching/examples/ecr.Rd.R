library(label.switching)


### Name: ecr
### Title: ECR algorithm (default version)
### Aliases: ecr

### ** Examples

#load a toy example: MCMC output consists of the random beta model
#	applied to a normal mixture of \code{K=2} components. The
# 	number of observations is equal to \code{n=5}. The number
#	of MCMC samples is equal to \code{m=300}. The 300 
#	simulated allocations are stored to array \code{z}. The 
#	complete MAP estimate corresponds to iteration \code{mapindex}.
data("mcmc_output")
z<-data_list$"z"
K<-data_list$"K"
mapindex<-data_list$"mapindex"

# mcmc parameters are stored to array \code{mcmc.pars}
mcmc.pars<-data_list$"mcmc.pars"
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances 
# mcmc.pars[,,3]: simulated weights
run<-ecr(zpivot = z[mapindex,],z = z, K = K)
# apply the permutations returned by typing:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the two components
# reordered.mcmc[,,2]: reordered variances
# reordered.mcmc[,,3]: reordered weights



