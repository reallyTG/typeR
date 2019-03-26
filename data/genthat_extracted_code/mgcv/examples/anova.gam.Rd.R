library(mgcv)


### Name: anova.gam
### Title: Approximate hypothesis tests related to GAM fits
### Aliases: anova.gam print.anova.gam
### Keywords: models smooth regression

### ** Examples

library(mgcv)
set.seed(0)
dat <- gamSim(5,n=200,scale=2)

b<-gam(y ~ x0 + s(x1) + s(x2) + s(x3),data=dat)
anova(b)
b1<-gam(y ~ x0 + s(x1) + s(x2),data=dat)
anova(b,b1,test="F")



