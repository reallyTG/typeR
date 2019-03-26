library(label.switching)


### Name: sjw
### Title: Probabilistic relabelling algorithm
### Aliases: sjw

### ** Examples

#load a toy example: MCMC output consists of the random beta model
# applied to a normal mixture of \code{K=2} components. The number of
# observations is equal to \code{n=5}. The number of MCMC samples is
# equal to \code{m=300}.  
data("mcmc_output")
mcmc.pars<-data_list$"mcmc.pars"
z<-data_list$"z"
K<-data_list$"K"
x<-data_list$"x"

# mcmc parameters are stored to array \code{mcmc.pars}
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances
# mcmc.pars[,,3]: simulated weights 
# The number of different parameters for the univariate
# normal mixture is equal to J = 3: means, variances 
# and weights. The generated allocations variables are 
# stored to \code{z}. The observed data is stored to \code{x}.  
# The complete data log-likelihood is defined as follows:
complete.normal.loglikelihood<-function(x,z,pars){
#	x: data (size = n)
#	z: allocation vector (size = n)
#	pars: K\times J vector of normal mixture parameters:
#		pars[k,1] = mean of the k-normal component
#		pars[k,2] = variance of the k-normal component
#		pars[k,3] = weight of the k-normal component
#			k = 1,...,K
	g <- dim(pars)[1] #K (number of mixture components)
	n <- length(x)	#this denotes the sample size
	logl<- rep(0, n)	
 	logpi <- log(pars[,3])
	mean <- pars[,1]
	sigma <- sqrt(pars[,2])
	logl<-logpi[z] + dnorm(x,mean = mean[z],sd = sigma[z],log = TRUE)
	return(sum(logl))
}

#run the algorithm:
run<-sjw(mcmc = mcmc.pars,z = z, 
complete = complete.normal.loglikelihood,x = x, init=0,threshold = 1e-4)
# apply the permutations returned by typing:
reordered.mcmc<-permute.mcmc(mcmc.pars,run$permutations)
# reordered.mcmc[,,1]: reordered means of the two components
# reordered.mcmc[,,2]: reordered variances 
# reordered.mcmc[,,3]: reordered weights



