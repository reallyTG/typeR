library(BMhyb)


### Name: AdaptiveConfidenceIntervalSampling
### Title: Confidence interval under adaptive cluster sampling technique.
### Aliases: AdaptiveConfidenceIntervalSampling

### ** Examples

	library(corpcor)
	#assign the number of non hybrid taxa
	ntax.nonhybrid<-8
	#assign the number of hybrid
	ntax.hybrid<-3
	#simulate the network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 3, allow.ghost=FALSE)

	#generate the tip data
	parameters <- c(0.05,1,1.7,0.005,0.5)
	names(parameters) <- c("sigma.sq", "mu", "bt", "vh", "SE")
	tips <- SimulateTipData(network$phy, network$flow, parameters)

	#set free parameters
	free.parameters<-rep(TRUE, 5)
	names(free.parameters) <- c("sigma.sq", "mu", "bt", "vh", "SE")


	#Simulate 100 samples
	interval.results <- AdaptiveConfidenceIntervalSampling(parameters, fn=CalculateLikelihood,
	lower=c(0, -Inf, 0, 0, 0)[which(free.parameters)], n.points=100,data=tips,
	phy=network$phy, flow=network$flow, actual.params =
	free.parameters[which(free.parameters)], allow.extrapolation=TRUE)

  #show the results
	interval.results.in <- interval.results[which(interval.results[,1] -
	min(interval.results[,1])<=2),]
	interval.results.out <- interval.results[which(interval.results[,1] -
	min(interval.results[,1])>2),]
	interval.results.in
	interval.results.out
	


