library(BMhyd)


### Name: GetVModified
### Title: Variance covariance matrix for the network model
### Aliases: GetVModified

### ** Examples

	#set the number of non hybrid species
	ntax.nonhybrid<-4	
	#set the number of hybrid species
	ntax.hybrid<-1
	#simulate a network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid, 
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5, 
	tree.height = 1, allow.ghost=FALSE)
	#assign the parameter values
	sigma.sq <- 0.01;mu <- 1;SE <- 0
	#get the variance covariance matrix
	GetVModified(c(sigma.sq,mu,SE), network$phy, network$flow, "bt")



