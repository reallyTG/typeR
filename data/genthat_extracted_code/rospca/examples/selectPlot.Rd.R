library(rospca)


### Name: selectPlot
### Title: Selection plot
### Aliases: selectPlot
### Keywords: plot

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

sl <- selectLambda(X, k=2, method="ROSPCA", lstep=0.1)
selectPlot(sl)



