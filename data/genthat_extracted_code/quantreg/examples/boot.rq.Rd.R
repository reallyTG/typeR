library(quantreg)


### Name: boot.rq
### Title: Bootstrapping Quantile Regression
### Aliases: boot.rq boot.rq.xy boot.rq.wxy boot.rq.pwy boot.rq.spwy
###   boot.rq.mcmb
### Keywords: regression

### ** Examples

y <- rnorm(50)
x <- matrix(rnorm(100),50)
fit <- rq(y~x,tau = .4)
summary(fit,se = "boot", bsmethod= "xy")
summary(fit,se = "boot", bsmethod= "pwy")
#summary(fit,se = "boot", bsmethod= "mcmb")



