library(Rearrangement)


### Name: Rearrangement-package
### Title: Point and Interval Rearrangement
### Aliases: Rearrangement-package Rearrangement
### Keywords: package manip datasets regression models

### ** Examples

##rearrangement example:
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
plot(age,height,pch=21,bg='gray',cex=.5,xlab="Age(years)",
ylab="Height(cms)", main="CEF (Regression Splines)",col='gray')
lines(ages,splreg,col='red',lwd=3)
lines(ages,rsplreg,col='blue',lwd=2)
legend("topleft",c('Original','Rearranged'),lty=1,col=c('red','blue'),bty='n')
detach(GrowthChart)

##rconint example:
## Not run: 
##D data(GrowthChart)
##D attach(GrowthChart)
##D 
##D nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
##D 
##D formula <- height~I(sin(nage))+I(cos(nage))+I(sin(2*nage)) +
##D             I(cos(2*nage))+I(sin(3*nage))+
##D             I(cos(3*nage))+ I(sin(4*nage)) + I(cos(4*nage))
##D 			
##D j <- simconboot(nage,height,lm,formula)
##D k <- rconint(j)
##D plot(k, border=NA, col='darkgray')
##D polygon.conint(j, border=NA, col='lightgray')
##D polygon.conint(k, border=NA, col='darkgray', density=50)
##D points(nage,height)
##D detach(GrowthChart)
## End(Not run)



