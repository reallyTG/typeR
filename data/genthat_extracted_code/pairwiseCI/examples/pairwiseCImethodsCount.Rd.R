library(pairwiseCI)


### Name: pairwiseCImethodsCount
### Title: Confidence intervals for two sample comparisons of count data
### Aliases: pairwiseCImethodsCount Poisson.ratio Quasipoisson.ratio
###   Negbin.ratio
### Keywords: htest

### ** Examples


df <- data.frame(count = rpois(n=20, lambda=5), treat=rep(LETTERS[1:4], each=5))

QPCI<-pairwiseCI(count ~ treat, data=df,
 alternative="two.sided", control="A", method="Quasipoisson.ratio")
 
QPCI


 


