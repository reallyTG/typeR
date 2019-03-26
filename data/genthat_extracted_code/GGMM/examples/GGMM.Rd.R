library(GGMM)


### Name: GGMM
### Title: Learning high-dimensional Gaussian Graphical Models with
###   Heterogeneous Data.
### Aliases: GGMM
### Keywords: GGMM

### ** Examples

 ## Don't show: 
set.seed(10)
library(GGMM)
result <- SimHetDat(n = 50, p = 10, M = 2, mu = 0.2, type = "band")
Est <- GGMM(result$data, result$A, alpha1 = 0.5, alpha2 = 0.5, alpha3 = 0.5, M = 2, iteration = 1, warm = 0)
## End(Don't show)
 ## No test: 
library(GGMM)
library(huge)
result <- SimHetDat(n = 100, p = 200, M = 3, mu = 0.5, type = "band")
Est <- GGMM(result$data, result$A, M = 3, iteration = 30, warm = 20)
## plot network by our estimated adjacency matrix.
huge.plot(Est$Adj)
## plot the Recall-Precision curve
plot(Est$RecPre[,1], Est$RecPre[,2], type="l", xlab="Recall", ylab="Precision")  
## End(No test)




