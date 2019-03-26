library(nlmeU)


### Name: logLik1
### Title: Calculates contribution of one subject to the log-likelihood
### Aliases: logLik1

### ** Examples

require(nlme)
  logLik(fm1 <- lme(distance ~ age, data = Orthodont)) # random is ~ age
  dt1 <- subset(Orthodont, Subject == "M01")
  logLik1(fm1, dt1)



