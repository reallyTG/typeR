library(fda)


### Name: smooth.basisPar
### Title: Smooth Data Using a Directly Specified Roughness Penalty
### Aliases: smooth.basisPar
### Keywords: smooth

### ** Examples

##
## simplest call
##
girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf, lambda=0.1))
plot(girlGrowthSm$fd, xlab="age", ylab="height (cm)",
         main="Girls in Berkeley Growth Study" )
plot(deriv(girlGrowthSm$fd), xlab="age", ylab="growth rate (cm / year)",
         main="Girls in Berkeley Growth Study" )
plot(deriv(girlGrowthSm$fd, 2), xlab="age",
        ylab="growth acceleration (cm / year^2)",
        main="Girls in Berkeley Growth Study" )
#  Undersmoothed with lambda = 0

##
## Another simple call
##
lipSm <- smooth.basisPar(liptime, lip, lambda=1e-9)$fd
plot(lipSm)

##
## A third example
##

x <- seq(-1,1,0.02)
y <- x + 3*exp(-6*x^2) + sin(1:101)/2
# sin not rnorm to make it easier to compare
# results across platforms

#  set up a saturated B-spline basis
basisobj101 <- create.bspline.basis(x)
fdParobj101 <- fdPar(basisobj101, 2, lambda=1)
result101   <- smooth.basis(x, y, fdParobj101)

resultP <- smooth.basisPar(argvals=x, y=y, fdobj=basisobj101, lambda=1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(result101, resultP)
## Don't show: 
)
## End(Don't show)
# TRUE

result4 <- smooth.basisPar(argvals=x, y=y, fdobj=4, lambda=1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(resultP, result4)
## Don't show: 
)
## End(Don't show)
# TRUE

result4. <- smooth.basisPar(argvals=x, y=y, lambda=1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(resultP, result4.)
## Don't show: 
)
## End(Don't show)
# TRUE

with(result4, c(df, gcv)) #  display df and gcv measures

result4.4 <- smooth.basisPar(argvals=x, y=y, lambda=1e-4)
with(result4.4, c(df, gcv)) #  display df and gcv measures
# less smoothing, more degrees of freedom, better fit

plot(result4.4)
lines(result4, col='green')
lines(result4$fd, col='green') # same as lines(result4, ...)

##
## fdnames?
##
girlGrow12 <- with(growth, smooth.basisPar(argvals=age, y=hgtf[, 1:2], 
              fdnames=c('age', 'girl', 'height'), lambda=0.1) )
girlGrow12. <- with(growth, smooth.basisPar(argvals=age, y=hgtf[, 1:2],
    fdnames=list(age=age, girl=c('Carol', 'Sally'), value='height'),
    lambda = 0.1) )

##
## Fourier basis with harmonic acceleration operator
##
daybasis65 <- create.fourier.basis(rangeval=c(0, 365), nbasis=65)
daytemp.fdSmooth <- with(CanadianWeather, smooth.basisPar(day.5,
       dailyAv[,,"Temperature.C"],
       daybasis65, fdnames=list("Day", "Station", "Deg C")) )





