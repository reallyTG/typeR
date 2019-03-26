library(mistat)


### Name: FAILTIME
### Title: Failure Times
### Aliases: FAILTIME
### Keywords: datasets

### ** Examples

data(FAILTIME)

library(survival)

SuRe <- survreg(
  Surv(time=FAILTIME) ~ 1 , 
  dist = "exponential")

summary(SuRe)



