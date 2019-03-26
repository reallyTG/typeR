library(CombinePortfolio)


### Name: CombinePortfolio-package
### Title: Estimation of optimal combined portfolios based on an 8-fund
###   rule.
### Aliases: CombinePortfolio CombinePortfolio-package
### Keywords: Package Portfolio Combination rule Restricted portfolio rule

### ** Examples

 
	ret<- diff(log(EuStockMarkets)) ## sample asset returns
	crule<- combination.rule(ret,detailed.output=TRUE)
	crule$w["1'",] ## Adjusted Kan-Zhou(2007) 2-fund rule
	crule$w["1''2",] ## Adjusted Kan-Zhou(2007) 3-fund rule
	crule$w["124",] ## Combination rule: Tangency+GMV+naive 4-fund rule, plug-in estimator
	crule$delta["124",] ## Combination weights
	crule$V[,c(1,2,4)] ## Combination targets: Tangency, GMV and naive (1/N)




