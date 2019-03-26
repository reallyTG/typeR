library(plaqr)


### Name: nonlinEffect
### Title: Nonlinear Effects Plots
### Aliases: nonlinEffect

### ** Examples

data(simData)
fit <- plaqr(y~.,~z1+z2,data=simData)

eff1 <- nonlinEffect(fit)
eff1
plot(eff1)

eff2 <- nonlinEffect(fit, select=c("z1","z2"), renames=c("Length", "Height"))
eff2
plot(eff2)

eff3 <- nonlinEffect(fit, select=c("z2","z1"), renames=c("Height", "Length"))
eff3
eff3$z1
eff3$z2
plot(eff3)

par(mfrow=c(1,2))
plot(eff3)



