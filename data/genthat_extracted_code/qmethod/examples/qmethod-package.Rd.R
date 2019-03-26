library(qmethod)


### Name: qmethod-package
### Title: Package for Q methodology analysis
### Aliases: qmethod-package qmethod-package

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
summary(results)
results



