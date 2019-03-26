library(BMhyb)


### Name: GetMeansModified
### Title: The species means for the network model
### Aliases: GetMeansModified

### ** Examples

	#number of nonhybrid species
	ntax.nonhybrid<-5
	#number of hybrid species
	ntax.hybrid<-2
	#simulate network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 1, allow.ghost=FALSE)
    #set the parameter values
    sigma.sq <- 0.01;mu <- 1;SE <- 0;bt<-12;vh<-0
    par<-c(sigma.sq,mu,SE,bt,vh)
    names(par)<-c("sigma.sq","mu","SE","bt","vh")
    actual.params<-12
    names(actual.params)<-"bt"
	#calculate the species means
	GetMeansModified(par, network$phy, network$flow,actual.params)
	


