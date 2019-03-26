library(randomLCA)


### Name: fitted
### Title: fitted values
### Aliases: fitted.randomLCA
### Keywords: methods

### ** Examples

dentistry.lcarandom <- randomLCA(dentistry[,1:5],freq=dentistry$freq,
	random=TRUE,probit=TRUE)
print(fitted(dentistry.lcarandom))



