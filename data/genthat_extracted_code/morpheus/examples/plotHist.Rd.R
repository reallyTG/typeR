library(morpheus)


### Name: plotHist
### Title: plotHist
### Aliases: plotHist

### ** Examples

## No test: 
beta <- matrix(c(1,-2,3,1),ncol=2)
mr <- multiRun(...) #see bootstrap example in ?multiRun : return lists of mu_hat
mu <- normalize(beta)
for (i in 1:2)
  mr[[i]] <- alignMatrices(res[[i]], ref=mu, ls_mode="exact")
plotHist(mr, 2, 1) #second row, first column
## End(No test)



