library(car)


### Name: dfbetaPlots
### Title: dfbeta and dfbetas Index Plots
### Aliases: dfbetaPlots dfbetasPlots dfbetaPlots.lm dfbetasPlots.lm
### Keywords: hplot regression

### ** Examples

dfbetaPlots(lm(prestige ~ income + education + type, data=Duncan))

dfbetasPlots(glm(partic != "not.work" ~ hincome + children, 
  data=Womenlf, family=binomial))



