library(label.switching)


### Name: stephens
### Title: Stephens' algorithm
### Aliases: stephens

### ** Examples

#load a toy example: MCMC output consists of the random beta model
# applied to a normal mixture of \code{K=2} components. The number 
# of observations is equal to \code{n=5}. The number of MCMC samples
# is equal to \code{m=300}. The matrix of allocation probabilities 
# is stored to matrix \code{p}. 
data("mcmc_output")
# mcmc parameters are stored to array \code{mcmc.pars}
mcmc.pars<-data_list$"mcmc.pars"
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances 
# mcmc.pars[,,3]: simulated weights 
# the computed allocation matrix is p
p<-data_list$"p"
run<-stephens(p)
# apply the permutations returned by typing:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the components
# reordered.mcmc[,,2]: reordered variances
# reordered.mcmc[,,3]: reordered weights



