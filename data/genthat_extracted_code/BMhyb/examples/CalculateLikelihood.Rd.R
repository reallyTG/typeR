library(BMhyb)


### Name: CalculateLikelihood
### Title: Calculate the likelihood value for the model
### Aliases: CalculateLikelihood

### ** Examples

	#set the number of hybrid
	ntax.nonhybrid<-5
	#set the number of hybrid
	ntax.hybrid<-1
	#simulate a network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 1, allow.ghost=FALSE)
sigma.sq <- 0.01;mu <- 1;SE <- 0
	#simulatedata
	data<-rnorm(ntax.nonhybrid+ntax.hybrid)
	names(data)<-paste("t",(1:(ntax.nonhybrid+ntax.hybrid)),sep="")
	#calculate the likelihood value
	CalculateLikelihood(c(sigma.sq,mu,SE), data, network$phy, network$flow, "vh",
	precision=2, proportion.mix.with.diag=0, allow.extrapolation=TRUE)
	


