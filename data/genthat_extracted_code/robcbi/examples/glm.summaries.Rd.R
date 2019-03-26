library(robcbi)


### Name: glm.summaries
### Title: Accessor functions for objects the class "glm"
### Aliases: covar.glm Rank.glm rscale.glm weights.glm
### Keywords: stats

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 lVol <-log(Vol); lRate <- log(Rate)
 z.glm <- glm(Resp~lVol+lRate,family=binomial)
 summary(z.glm)
 covar(z.glm)
 Rank(z.glm)
 rscale(z.glm)
 weights(z.glm)



