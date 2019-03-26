library(LearnBayes)


### Name: normal.normal.mix
### Title: Computes the posterior for normal sampling and a mixture of
###   normals prior
### Aliases: normal.normal.mix
### Keywords: models

### ** Examples

probs=c(.5, .5)
normal.par1=c(0,1)
normal.par2=c(2,.5)
normalpar=rbind(normal.par1,normal.par2)
y=1; sigma2=.5
data=c(y,sigma2)
normal.normal.mix(probs,normalpar,data)



