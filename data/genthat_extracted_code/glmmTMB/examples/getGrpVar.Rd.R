library(glmmTMB)


### Name: getGrpVar
### Title: Get Grouping Variable
### Aliases: getGrpVar
### Keywords: internal

### ** Examples

data(cbpp,package="lme4")
cbpp$obs <- factor(seq(nrow(cbpp)))
rt <- lme4::glFormula(cbind(size,incidence-size)~(1|herd)+(1|obs),
  data=cbpp,family=binomial)$reTrms
getGrpVar(rt$flist)



