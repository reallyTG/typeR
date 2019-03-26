library(qmethod)


### Name: qdc
### Title: Q methodology: distinguishing and consensus statements
### Aliases: qdc

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
sed <- as.data.frame(results[[7]][[3]])
zsc <- results[[5]]
qdc(lipset[[1]], nfactors = 3, zsc = zsc, sed = sed)



