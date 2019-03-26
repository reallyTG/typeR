library(PoweR)


### Name: pvalueMC
### Title: Monte-Carlo computation of a p-value for one single test
###   statistic.
### Aliases: pvalueMC
### Keywords: univar htest

### ** Examples

x <- rnorm(100)
statcompute(1,x,level = c(0.05),alter = 3)$pvalue
pvalueMC(x,stat.index = 1,null.law.index = 2,M = 10^5,alter = 3)



