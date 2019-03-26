library(cancerTiming)


### Name: readSimulation
### Title: Simulate reads based on an event matrix
### Aliases: readSimulation

### ** Examples

	#simulate from CNLOH event with pi[0]=.1
	Amat<-makeEventHistory(totalCopy=2,type="LOH")[[1]]
	piVal<-c(.1,.9)
	qvec<-prop.table(Amat%*%piVal)

	sims<-readSimulation(10, alleleSet=allAF(totalCopy=2)[[1]], q=qvec, 
	totalCopy=2, mutRate = 100, seqError = 0.1, fixedN = TRUE, 
	normCont = 0.1, aveReadCoverage = 30)



