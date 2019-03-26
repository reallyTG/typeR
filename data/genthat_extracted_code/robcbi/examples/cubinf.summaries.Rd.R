library(robcbi)


### Name: cubinf.summaries
### Title: Functions required by the corresponding access functions
### Aliases: residuals.cubinf summary.cubinf covar.cubinf deviance.cubinf
###   family.cubinf Rank.cubinf rscale.cubinf weights.cubinf
### Keywords: robust stats

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 lVol <-log(Vol); lRate <- log(Rate)
 z.glm <- glm(Resp~lVol+lRate,family=binomial)
 summary(z.glm)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
 summary(z.cub)
 weights(z.cub)
 covar(z.cub)
 deviance(z.cub)
 Rank(z.cub)
 residuals(z.cub)
 rscale(z.cub)



