library(Rearrangement)


### Name: rearrangement
### Title: Rearrangement
### Aliases: rearrangement
### Keywords: optimize manip regression models

### ** Examples

##Univariate example:
library(splines)
data(GrowthChart)
attach(GrowthChart)

ages <- unique(sort(age))
aknots <- c(3, 5, 8, 10, 11.5, 13, 14.5, 16, 18)
splines_age <- bs(age,kn=aknots)
sformula <- height~splines_age
sfunc <- approxfun(age,lm(sformula)$fitted.values)
splreg <- sfunc(ages)
rsplreg <- rearrangement(list(ages),splreg)
plot(age,height,pch=21,bg='gray',cex=.5,xlab="Age (years)",ylab="Height (cms)",
     main="CEF (Regression Splines)",col='gray')
lines(ages,splreg,col='red',lwd=3)
lines(ages,rsplreg,col='blue',lwd=2)
legend("topleft",c('Original','Rearranged'),lty=1,col=c('red','blue'),bty='n')
detach(GrowthChart)

##Bivariate example:
## Not run: 
##D library(quantreg)
##D data(GrowthChart)
##D attach(GrowthChart)
##D 
##D ages <- unique(sort(age))
##D taus <- c(1:999)/1000
##D nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
##D nages <- 2 * pi * (ages - min(ages)) / (max(ages) - min(ages))
##D fform <- height ~ I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
##D           I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
##D ffit <- rq(fform, tau = taus)
##D fcoefs <- t(ffit$coef)
##D freg <- rbind(1, sin(nages), cos(nages), sin(2*nages), 
##D               cos(2*nages),sin(3*nages), cos(3*nages), sin(4*nages), cos(4*nages) )
##D fcqf <- crossprod(t(fcoefs),freg)
##D rrfcqf <- rearrangement(list(taus,ages),fcqf, avg=TRUE)
##D tdom <-c(1,10*c(1:99),999)
##D adom <-c(1,5*c(1:floor(length(ages)/5)), length(ages))
##D 
##D par(mfrow=c(2,1))
##D persp(taus[tdom],ages[adom],rrfcqf[tdom,adom],xlab='quantile',
##D       ylab='age',zlab='height',col='lightgreen',theta=315,phi=25,shade=.5)
##D title("CQP: Average Quantile/Age Rearrangement")
##D contour(taus,ages,rrfcqf,xlab='quantile',ylab='age',col='green',
##D         levels=10*c(ceiling(min(fcqf)/10):floor(max(fcqf)/10)))
##D title("CQP: Contour (RR-Quantile/Age)")
##D 
##D detach(GrowthChart)
## End(Not run)



