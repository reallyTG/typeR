library(psych)


### Name: fa.sort
### Title: Sort factor analysis or principal components analysis loadings
### Aliases: fa.sort fa.organize
### Keywords: multivariate

### ** Examples

test.simple <- fa(sim.item(16),2)
fa.sort(test.simple)
fa.organize(test.simple,c(2,1))  #the factors but not the items have been rearranged



