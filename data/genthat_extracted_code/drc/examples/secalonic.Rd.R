library(drc)


### Name: secalonic
### Title: Root length measurements
### Aliases: secalonic
### Keywords: datasets

### ** Examples


## Fitting a four-parameter log-logistic model
secalonic.m1 <- drm(rootl ~ dose, data = secalonic, fct = LL.4())
summary(secalonic.m1)

## Fitting a three-parameter log-logistic model
##  lower limit fixed at 0
secalonic.m2 <- drm(rootl ~ dose, data = secalonic, fct = LL.3())
summary(secalonic.m1)

## Comparing logistic and log-logistic models
## (Figure 1 in Ritz (2009))
secalonic.LL4 <- drm(rootl ~ dose, data = secalonic, fct = LL.4())
secalonic.L4 <- drm(rootl ~ dose, data = secalonic, fct = L.4())

plot(secalonic.LL4, broken=TRUE, ylim=c(0,7), xlab="Dose (mM)", ylab="Root length (cm)", 
cex=1.2, cex.axis=1.2, cex.lab=1.2, lwd=2)

plot(secalonic.L4, broken=TRUE, ylim=c(0,7), add=TRUE, type="none", lty=2, lwd=2)

abline(h=coef(secalonic.L4)[3], lty=3, lwd=2)




