library(GGMM)


### Name: GGMM-package
### Title: Gaussian Graphical Mixture Models
### Aliases: GGMM-package
### Keywords: package

### ** Examples

 ## Don't show: 
set.seed(10)
library(GGMM)
result <- SimHetDat(n = 30, p = 10, M = 3, mu = 0, type = "band")
Est <- GGMM(result$data, result$A, alpha1 = 0.5, alpha2 = 0.5, alpha3 = 0.5, M = 3, iteration = 1, warm = 0)
## End(Don't show)
## No test: 
library(GGMM)
library(huge)
result <- SimHetDat(n = 100, p = 200, M = 2, mu = 0.5, type = "band")
Graph <- GGMM(result$data, result$A, M = 2, iteration = 30, warm = 20)
      
## End(No test)



