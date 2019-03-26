library(randomLCA)


### Name: AIC3
### Title: AIC with 3 penalty for randomLCA object
### Aliases: AIC3
### Keywords: methods

### ** Examples

pap.lca2 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=2)
print(AIC3(pap.lca2))



