library(drc)


### Name: W1.4
### Title: The four-parameter Weibull functions
### Aliases: W1.4 w4 W2.4 W2x.4
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter Weibull (type 1) model
terbuthylazin.m1 <- drm(rgr~dose, data = terbuthylazin, fct = W1.4())
summary(terbuthylazin.m1)

## Fitting a first-order multistage model
## to data from BMDS by EPA
## (Figure 3 in Ritz (2009))
bmds.ex1 <- data.frame(ad.dose=c(0,50,100), dose=c(0, 2.83, 5.67), 
num=c(6,10,19), total=c(50,49,50))

bmds.ex1.m1<-drm(num/total~dose, weights=total, data=bmds.ex1, 
fct=W2.4(fixed=c(1,NA,1,NA)), type="binomial")

modelFit(bmds.ex1.m1)  # same as in BMDS

summary(bmds.ex1.m1)  # same background estimate as in BMDS

logLik(bmds.ex1.m1)

## BMD estimate identical to BMDS result
## BMDL estimate differs from BMDS result (different method)
ED(bmds.ex1.m1, 10, ci="delta")

## Better fit

bmds.ex1.m2<-drm(num/total~dose, weights=total, data=bmds.ex1, 
fct=W1.4(fixed=c(-1,NA,1,NA)), type="binomial")
modelFit(bmds.ex1.m2)
summary(bmds.ex1.m2)

ED(bmds.ex1.m2, 50, ci = "delta")

## Creating Figure 3 in Ritz (2009)
bmds.ex1.m3 <- drm(num/total~dose, weights=total, data=bmds.ex1, 
fct=LL.4(fixed=c(-1,NA,1,NA)), type="binomial")

plot(bmds.ex1.m1, ylim = c(0.05, 0.4), log = "", lty = 3, lwd = 2, 
xlab = "Dose (mg/kg/day)", ylab = "",
cex=1.2, cex.axis=1.2, cex.lab=1.2)

mtext("Tumor incidence", 2, line=4, cex=1.2)  # tailored y axis label

plot(bmds.ex1.m2, ylim = c(0.05, 0.4), log = "", add = TRUE, lty = 2, lwd = 2)

plot(bmds.ex1.m3, ylim = c(0.05, 0.4), log = "", add = TRUE, lty = 1, lwd = 2)

arrows(2.6 , 0.14, 2, 0.14, 0.15, lwd=2)
text(2.5, 0.14, "Weibull-1", pos=4, cex=1.2)




