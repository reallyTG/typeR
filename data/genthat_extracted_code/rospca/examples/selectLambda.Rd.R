library(rospca)


### Name: selectLambda
### Title: Selection of sparsity parameter using IC
### Aliases: selectLambda
### Keywords: optimize

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

sl <- selectLambda(X, k=2, method="ROSPCA", lstep=0.1)
selectPlot(sl)



