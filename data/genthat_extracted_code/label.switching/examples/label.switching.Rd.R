library(label.switching)


### Name: label.switching
### Title: Main calling function
### Aliases: label.switching

### ** Examples

# We will apply four methods:
# ECR, ECR-ITERATIVE-1, PRA, AIC, STEPHENS and DATA-BASED.
# default ECR will use two different pivots.

#load a toy example: MCMC output consists of the random beta model
# applied to a normal mixture of \code{K=2} components. The number of
# observations is equal to \code{n=5}. The number of MCMC samples is
# equal to \code{m=300}. simulated allocations are stored to array \code{z}. 
data("mcmc_output")
mcmc.pars<-data_list$"mcmc.pars"
# mcmc parameters are stored to array \code{mcmc.pars}
# mcmc.pars[,,1]: simulated means of the two components
# mcmc.pars[,,2]: simulated variances 
# mcmc.pars[,,3]: simulated weights 
# We will use two pivots for default ECR algorithm:
# the first one corresponds to iteration \code{mapindex} (complete MAP)
# the second one corresponds to iteration \code{mapindex.non} (observed MAP)
# The array \code{p} corresponds to the the allocation probabilities 
z<-data_list$"z"
K<-data_list$"K"
p<-data_list$"p"
x<-data_list$"x"
mapindex<-data_list$"mapindex"
mapindex.non<-data_list$"mapindex.non"
# The PRA method will use as pivot the iteration that corresponds to
# the non-complete MAP estimate (mapindex). 

#Apply the six methods by typing:

ls<-label.switching(method=c("ECR","ECR-ITERATIVE-1","PRA","STEPHENS","AIC","DATA-BASED"),
zpivot=z[c(mapindex,mapindex.non),],z = z,K = K, data = x,
prapivot = mcmc.pars[mapindex,,],p=p,mcmc = mcmc.pars)

#plot the raw and reordered means of the K=2 normal mixture components for each method
par(mfrow = c(2,4))
#raw MCMC output for the means (with label switching)
matplot(mcmc.pars[,,1],type="l",
xlab="iteration",main="Raw MCMC output",ylab = "means")
# Reordered outputs
matplot(permute.mcmc(mcmc.pars,ls$permutations$"ECR-1")$output[,,1],type="l",
xlab="iteration",main="ECR (1st pivot)",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"ECR-2")$output[,,1],type="l",
xlab="iteration",main="ECR (2nd pivot)",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"ECR-ITERATIVE-1")$output[,,1],
type="l",xlab="iteration",main="ECR-iterative-1",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"PRA")$output[,,1],type="l",
xlab="iteration",main="PRA",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"STEPHENS")$output[,,1],type="l",
xlab="iteration",main="STEPHENS",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"AIC")$output[,,1],type="l",
xlab="iteration",main="AIC",ylab = "means")
matplot(permute.mcmc(mcmc.pars,ls$permutations$"DATA-BASED")$output[,,1],type="l",
xlab="iteration",main="DATA-BASED",ylab = "means")

#######################################################
# if the useR wants to apply the SJW algorithm as well:
# The SJW method needs to define the complete log-likelihood of the
# model. For the univariate normal mixture, this is done as follows:

complete.normal.loglikelihood<-function(x,z,pars){
	#x: denotes the n data points
	#z: denotes an allocation vector (size=n)
	#pars: K\times 3 vector of means,variance, weights
	# pars[k,1]: corresponds to the mean of component k
	# pars[k,2]: corresponds to the variance of component k
	# pars[k,3]: corresponds to the weight of component k
	g <- dim(pars)[1]
	n <- length(x)
	logl<- rep(0, n)
 	logpi <- log(pars[,3])
	mean <- pars[,1]
	sigma <- sqrt(pars[,2])
	logl<-logpi[z] + dnorm(x,mean = mean[z],sd = sigma[z],log = T)
	return(sum(logl))
}

# and then run (after removing all #):
#ls<-label.switching(method=c("ECR","ECR-ITERATIVE-1","ECR-ITERATIVE-2",
#"PRA","STEPHENS","SJW","AIC","DATA-BASED"),
#zpivot=z[c(mapindex,mapindex.non),],z = z,
#K = K,prapivot = mcmc.pars[mapindex,,],p=p,
#complete = complete.normal.loglikelihood,mcmc.pars,
#data = x)




