library(CorrBin)


### Name: ran.CBData
### Title: Generate random correlated binary data
### Aliases: ran.CBData
### Keywords: distribution

### ** Examples

set.seed(3486)
ss <- expand.grid(Trt=0:3, ClusterSize=5, Freq=4)
#Trt is converted to a factor
rd <- ran.CBData(ss, p.gen.fun=function(g)0.2+0.1*g)
rd



