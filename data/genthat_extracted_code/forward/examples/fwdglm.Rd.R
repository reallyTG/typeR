library(forward)


### Name: fwdglm
### Title: Forward Search in Generalized Linear Models
### Aliases: fwdglm print.fwdglm
### Keywords: robust regression models

### ** Examples
 
data(cellular)
cellular$TNF <- as.factor(cellular$TNF)
cellular$IFN <- as.factor(cellular$IFN)
mod <- fwdglm(y ~ TNF + IFN, data=cellular, family=poisson(log), nsamp=200)
summary(mod)
## Not run: plot(mod)
plot(mod, 1)
plot(mod, 5)
plot(mod, 6, ylim=c(-3, 20))
plot(mod, 7)
plot(mod, 8)



