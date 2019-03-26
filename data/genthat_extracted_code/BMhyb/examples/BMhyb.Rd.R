library(BMhyb)


### Name: BMhyb
### Title: Comparative method for studying hybridization using Brownian
###   motion for trait evolution
### Aliases: BMhyb

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
	#run the analysis uses model 4 under optimization method (more than 5 seconds)
	## No test: 
	BMhyb(tips,network$phy,network$flow, opt.method="Nelder-Mead", models=4, verbose=TRUE,
	get.se=FALSE, plot.se=FALSE, store.sims=FALSE, precision=2, auto.adjust=FALSE,
	likelihood.precision=0.001, allow.extrapolation=TRUE)
	
## End(No test)
  #run the analysis uses model 4 under Grid method
  result<-BMhybGrid(tips,network$phy,network$flow, models=4, verbose=FALSE,
          get.se=FALSE, plot.se=FALSE, store.sims=FALSE, precision=2,
          auto.adjust=FALSE,likelihood.precision=0.001,
          allow.extrapolation=FALSE, n.points=10,
          measurement.error = 0, do.kappa.check=FALSE,
          number.of.proportions = 101, number.of.proportions.adaptive = 101,
          allow.restart=FALSE, lower.bounds = c(0, -Inf, 0.000001, 0, 0),
          upper.bounds=c(10,Inf,100,100,100),
          badval.if.not.positive.definite=TRUE,
          attempt.deletion.fix=FALSE, starting.values=NULL,
          do.Brissette.correction=FALSE, do.Higham.correction=TRUE,
          do.DE.correction=FALSE)
  #>result
  #  Model   sigma.sq         mu       bt       vh SE      AICc  NegLogL K
  #     4 0.02950803 0.02499673 8.064703 1.127043  0 -6.570164 2.714918 4
  #  sigma.sq.lower sigma.sq.upper mu.lower mu.upper bt.lower bt.upper vh.lower
  #             NA             NA       NA       NA       NA       NA       NA
  #  vh.upper SE.lower SE.upper penalty deltaAICc AkaikeWeight
  #       NA       NA       NA       0         0            1
	


