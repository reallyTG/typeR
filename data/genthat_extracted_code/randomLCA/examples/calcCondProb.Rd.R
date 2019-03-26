library(randomLCA)


### Name: calcCondProb
### Title: Calculate Conditional Outcome Probabilities
### Aliases: calcCondProb
### Keywords: methods

### ** Examples

dentistry.lcarandom <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
	random=TRUE,probit=TRUE)
print(calcCondProb(dentistry.lcarandom))



