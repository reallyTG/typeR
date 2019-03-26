library(randomLCA)


### Name: outcomeProbs
### Title: Extract outcome probabilities for randomLCA object
### Aliases: outcomeProbs outcomeProbs.randomLCA
### Keywords: methods

### ** Examples

# standard latent class with 2 classes
dentistry.lca2 <- randomLCA(dentistry[,1:5], freq=dentistry$freq, nclass=2)
print(outcomeProbs(dentistry.lca2))
# print on the default logit scale
print(outcomeProbs(dentistry.lca2, scale="raw"))
# convert back to probabilities
print(1.0/(1.0+exp(-outcomeProbs(dentistry.lca2, scale="raw")[[1]])))
print(1.0/(1.0+exp(-outcomeProbs(dentistry.lca2, scale="raw")[[2]])))



