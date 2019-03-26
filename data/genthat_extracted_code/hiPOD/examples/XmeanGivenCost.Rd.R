library(hiPOD)


### Name: XmeanGivenCost
### Title: A function used to find best coverage given cost and other
###   constraints
### Aliases: XmeanGivenCost
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(costPar, cost, P, lower.Xmean, upper.Xmean)
{
	
	CostPerExp <- costPar[1]
	CostPerPool <- costPar[2]
	CostPerX <- costPar[3]

	cost <- rep(cost, length(P))

	Xmean.max <- floor((cost-CostPerExp-CostPerPool*P)/(CostPerX*P))
	Xmean.good <- (Xmean.max >= rep(lower.Xmean, length(Xmean.max)))

	Xmean.max <- ifelse(Xmean.max<lower.Xmean, lower.Xmean, Xmean.max)
	Xmean.max <- ifelse(Xmean.max>upper.Xmean, upper.Xmean, Xmean.max)

	list(Xmean.good, Xmean.max)
  }



