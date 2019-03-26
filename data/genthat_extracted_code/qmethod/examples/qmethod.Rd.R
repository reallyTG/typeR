library(qmethod)


### Name: qmethod
### Title: Q methodology analysis
### Aliases: qmethod

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
summary(results)
results #shows all results



