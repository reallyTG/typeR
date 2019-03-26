library(robcbi)


### Name: correl
### Title: Generic functions for objects of classes "glm" and "cubinf"
### Aliases: correl covar Rank rscale weights
### Keywords: stats

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 lVol <-log(Vol); lRate <- log(Rate)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
 correl(z.cub)
 covar(z.cub)
 Rank(z.cub)
 rscale(z.cub)
 weights(z.cub)



