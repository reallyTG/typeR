library(R2MLwiN)


### Name: mmmec
### Title: EC data on UV radiation exposure & malignant melanoma.
### Aliases: mmmec
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(mmmec, package = "R2MLwiN")
##D 
##D (mymodel3 <- runMLwiN(log(obs) ~ 1 + uvbi + offset(log(exp)) + (1 | nation) + (1 | region), 
##D  D = "Poisson", estoptions = list(EstM = 1), data = mmmec))
##D 
## End(Not run)



