library(alr3)


### Name: pod
### Title: Fit partial one-dimensional, or POD models, based on a linear
###   model
### Aliases: pod pod.lm pod.formula print.pod summary.pod coef.pod
###   anova.pod deviance.pod resid.pod formula.pod fitted.pod podresponse
###   df.residual.pod predict.pod plot.pod plot.pod.lm podnls.fit
###   residuals.pod vcov.pod
### Keywords: models regression hplot

### ** Examples

head(ais)
m1 <- pod(LBM ~ Ht + Wt + RCC, data= ais, group= Sex)
anova(m1) # compare four models
plot(m1) # draw the plot
m2 <- update(m1, mean.function="parallel")
plot(m2)



