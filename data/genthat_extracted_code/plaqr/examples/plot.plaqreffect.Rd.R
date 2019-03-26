library(plaqr)


### Name: plot.plaqreffect
### Title: Nonlinear Effect Plot for a Partially Linear Additive Quantile
###   Regression Model
### Aliases: plot.plaqreffect

### ** Examples

data(simData)
fit <- plaqr(y~.,~z1+z2,data=simData)
eff <- nonlinEffect(fit, select=c("z1","z2"), renames=c("Length", "Height"))
eff

plot(eff)
plot(eff, select=1, col="red")
plot(eff, select=c(2,1), titles=c("Effect Z1","Effect Z2"))
plot(eff, select=1, col="red", lwd=4)

par(mfrow=c(1,2))
plot(eff)



