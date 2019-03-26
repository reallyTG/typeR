library(qmethod)


### Name: qdc.zsc
### Title: Q methodology: distinguishing and consensus statements
### Aliases: qdc.zsc

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
qdc.zsc(results)



