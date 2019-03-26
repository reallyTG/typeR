library(GGMM)


### Name: BRGM
### Title: Learning gene regulatory networks for breast cancer.
### Aliases: BRGM
### Keywords: BRGM

### ** Examples

 ## Don't show: 
set.seed(10)
library(GGMM)
data(breast)
Gra <- BRGM(breast[1:50,1:5], M=2,alpha1 = 0.5, alpha2 = 0.8, alpha3 = 0.9, iteration = 1, warm = 0)
## End(Don't show)
## No test: 

library(GGMM)
library(huge)
data(breast)
## long time ##
M <- 3
Gra <- BRGM(breast, M, iteration = 30, warm = 20)
## plot gene regulatory network by our estimated adjacency matrix.
huge.plot(Gra$Adj)

## End(No test)



         



