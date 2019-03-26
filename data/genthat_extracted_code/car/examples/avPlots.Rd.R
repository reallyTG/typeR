library(car)


### Name: avPlots
### Title: Added-Variable Plots
### Aliases: avPlots avp avPlot avPlot.lm avPlot.glm
### Keywords: hplot regression

### ** Examples

avPlots(lm(prestige ~ income + education + type, data=Duncan))

avPlots(glm(partic != "not.work" ~ hincome + children, 
  data=Womenlf, family=binomial), id=FALSE)
  
m1 <- lm(partic ~ tfr + menwage + womwage + debt + parttime, Bfox)
par(mfrow=c(1,3))
# marginal plot, ignoring other predictors:
with(Bfox, dataEllipse(womwage, partic, levels=0.5)) 
abline(lm(partic ~ womwage, Bfox), col="red", lwd=2)
# AV plot, adjusting for others:
avPlots(m1, ~ womwage, ellipse=list(levels=0.5)) 
# AV plot, adjusting and scaling as in marginal plot
avPlots(m1, ~ womwage, marginal.scale=TRUE, ellipse=list(levels=0.5)) 



