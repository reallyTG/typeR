library(FSA)


### Name: depletion
### Title: Computes the Leslie or DeLury population estimate from catch and
###   effort data.
### Aliases: depletion plot.depletion summary.depletion coef.depletion
###   anova.depletion confint.depletion rSquared.depletion
### Keywords: hplot manip

### ** Examples

## Leslie model examples
# no Ricker modification
l1 <- depletion(SMBassLS$catch,SMBassLS$effort,method="Leslie")
summary(l1)
summary(l1,verbose=TRUE)
summary(l1,parm="No")
rSquared(l1)
rSquared(l1,digits=1,percent=TRUE)
cbind(Est=coef(l1),confint(l1))
cbind(Est=coef(l1,parm="No"),confint(l1,parm="No"))
cbind(Est=coef(l1,parm="q"),confint(l1,parm="q"))
summary(l1,parm="lm")
plot(l1)

# with Ricker modification
l2 <- depletion(SMBassLS$catch,SMBassLS$effort,method="Leslie",Ricker.mod=TRUE)
summary(l2)
cbind(Est=coef(l2),confint(l1))
plot(l2)

## DeLury model examples
# no Ricker modification
d1 <- depletion(SMBassLS$catch,SMBassLS$effort,method="DeLury")
summary(d1)
summary(d1,parm="q")
summary(d1,verbose=TRUE)
rSquared(d1)
cbind(Est=coef(d1),confint(d1))
summary(d1,parm="lm")
plot(d1)

# with Ricker modification
d2 <- depletion(SMBassLS$catch,SMBassLS$effort,method="DeLury",Ricker.mod=TRUE)
summary(d2)
cbind(Est=coef(d2),confint(d2))
cbind(Est=coef(d2,parm="q"),confint(d2,parm="q"))
plot(d2)




