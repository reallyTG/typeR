library(RLRsim)


### Name: exactRLRT
### Title: Restricted Likelihood Ratio Tests for additive and linear mixed
###   models
### Aliases: exactRLRT
### Keywords: htest

### ** Examples


library(lme4)
data(sleepstudy)
mA <- lmer(Reaction ~ I(Days-4.5) + (1|Subject) + (0 + I(Days-4.5)|Subject), 
  data = sleepstudy)
m0 <- update(mA, . ~ . - (0 + I(Days-4.5)|Subject))
m.slope  <- update(mA, . ~ . - (1|Subject))
#test for subject specific slopes:
exactRLRT(m.slope, mA, m0)

library(mgcv)
data(trees)
#test quadratic trend vs. smooth alternative
m.q<-gamm(I(log(Volume)) ~ Height + s(Girth, m = 3), data = trees, 
  method = "REML")$lme
exactRLRT(m.q)
#test linear trend vs. smooth alternative
m.l<-gamm(I(log(Volume)) ~ Height + s(Girth, m = 2), data = trees, 
  method = "REML")$lme
exactRLRT(m.l)




