library(RLRsim)


### Name: exactLRT
### Title: Likelihood Ratio Tests for simple linear mixed models
### Aliases: exactLRT
### Keywords: htest

### ** Examples


library(nlme);
data(Orthodont);

##test for Sex:Age interaction and Subject-Intercept
mA<-lme(distance ~ Sex * I(age - 11), random = ~ 1| Subject,
  data = Orthodont, method = "ML")
m0<-lm(distance ~ Sex + I(age - 11), data = Orthodont)
summary(mA)
summary(m0)
exactLRT(m = mA, m0 = m0)




