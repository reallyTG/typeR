library(PTAk)


### Name: FCA2
### Title: Correspondence Analysis for 2-way tables
### Aliases: FCA2
### Keywords: models array algebra multivariate

### ** Examples

 data(crimerate)
 cri.FCA2 <- FCA2(crimerate)
 summary(cri.FCA2)
  plot(cri.FCA2, mod = c(1,2), nb1 = 2, nb2 = 3) # unscaled
  plot(cri.FCA2, mod = c(1,2), nb1 = 2, nb2 = 3, coefi = 
  	list(c(0.130787,0.130787),c(0.104359,0.104359)) )# symmetric-map biplot
 CTR(cri.FCA2, mod = 1, solnbs = 2:4)
 CTR(cri.FCA2, mod = 2, solnbs = 2:4)
 COS2(cri.FCA2, mod = 2, solnbs = 2:4)
 
 



