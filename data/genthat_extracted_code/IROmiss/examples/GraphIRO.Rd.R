library(IROmiss)


### Name: GraphIRO
### Title: Learning high-dimensional Gaussian Graphical Models with Missing
###   Observations.
### Aliases: GraphIRO
### Keywords: GraphIRO

### ** Examples

 ## No test: 
library(IROmiss)
library(huge)
result <- SimGraDat(n = 200, p = 100, type = "band", rate = 0.1)
Est <- GraphIRO(result$data, result$A, iteration = 20, warm = 10)
## plot network by our estimated adjacency matrix.
huge.plot(Est$Adj)  
## plot the Recall-Precision curve.
plot(Est$RecPre[,1], Est$RecPre[,2], type="l", xlab="Recall", ylab="Precision")  

## End(No test)




