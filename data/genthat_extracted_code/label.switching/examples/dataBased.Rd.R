library(label.switching)


### Name: dataBased
### Title: Data-based labelling
### Aliases: dataBased

### ** Examples

#load a toy example: MCMC output consists of the random beta model
# applied to a normal mixture of \code{K=2} components. The number of
# observations is equal to \code{n=5}. The number of MCMC samples is
# equal to \code{m=300}. The 1000 generated MCMC samples are stored 
#to array mcmc.pars. 
data("mcmc_output")
z<-data_list$"z"
K<-data_list$"K"
x<-data_list$"x"
mcmc.pars<-data_list$"mcmc.pars"
# mcmc parameters are stored to array \code{mcmc.pars}
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances of the two components
# mcmc.pars[,,3]: simulated weights of the two components
# Apply dataBased relabelling
run<-dataBased(x = x, K = K, z = z)
# apply the permutations returned by typing:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the two components
# reordered.mcmc[,,2]: reordered variances of the components
# reordered.mcmc[,,3]: reordered weights 



