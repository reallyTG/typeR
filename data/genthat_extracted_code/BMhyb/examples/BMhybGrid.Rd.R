library(BMhyb)


### Name: BMhybGrid
### Title: Comparative method for studying hybridization using Brownian
###   motion for trait evolution
### Aliases: BMhybGrid

### ** Examples

	#set up the number of non hybrid
	ntax.nonhybrid<-2
	#set up the number of non hybrid
	ntax.hybrid<-1
	#simulate a network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 1, allow.ghost=FALSE)
    #simulate the tips data
	tips<-rnorm(ntax.nonhybrid+ntax.hybrid)
	names(tips)<-paste("t",(1:(ntax.nonhybrid+ntax.hybrid)),sep="")
	#run the analysis uses model 3
	## No test: 
	BMhyb(tips,network$phy,network$flow, opt.method="Nelder-Mead", models=3, verbose=TRUE,
	get.se=FALSE, plot.se=FALSE, store.sims=FALSE, precision=2, auto.adjust=FALSE,
	likelihood.precision=0.001, allow.extrapolation=TRUE)
	
## End(No test)
	


