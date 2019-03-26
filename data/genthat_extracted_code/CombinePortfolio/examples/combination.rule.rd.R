library(CombinePortfolio)


### Name: combination.rule
### Title: Function for estimating portfolio weights by the 8fund rule
### Aliases: combination.rule
### Keywords: Portfolio Combination rule

### ** Examples

	ret<- diff(log(EuStockMarkets))

	combination.rule(ret) ## all 8-fund rule estimates

	crule<- combination.rule(ret,gamma=5,detailed.output=TRUE)
	crule$w["1'",] ## Adjusted Kan-Zhou(2007) 2-fund rule
	crule$w["1''2",] ## Adjusted Kan-Zhou(2007) 3-fund rule
	crule$w["124",] ## Combination rule: Tangency+GMV+naive 4-fund rule, plug-in estimator
	crule$delta["124",] ## Combination weights
	crule$V[,c(1,2,4)] ## Combination targets: Tangency, GMV and naive

	## only models that can contain Tangency, GMV and naive, but must contain GMV
	crule2<- combination.rule(ret, superset=c(1,2,4), subset=2, detailed.output=TRUE) 
	crule2$w # weights
	crule2$delta # combination weights
	crule2$V # target vectors

	## case where T <= N - 4
	ret2<- cbind(ret[1:10,], ret[11:20,], ret[21:30,]) ## (TxN) 10x12-matrix
	combination.rule(ret2) ## only accessible solutions




