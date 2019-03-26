library(randomLCA)


### Name: calcMargProb
### Title: Calculates Marginal Outcome Probabilities
### Aliases: calcMargProb
### Keywords: methods

### ** Examples

dentistry.lcarandom <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
	random=TRUE,probit=TRUE)
print(calcMargProb(dentistry.lcarandom))



