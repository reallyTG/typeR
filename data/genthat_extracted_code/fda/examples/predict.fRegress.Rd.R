library(fda)


### Name: predict.fRegress
### Title: Predict method for Functional Regression
### Aliases: predict.fRegress
### Keywords: models

### ** Examples

###
###
### vector response with functional explanatory variable
###
###
##
## example from help('lm')
##
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels=c("Ctl","Trt"))
weight <- c(ctl, trt)
fRegress.D9 <- fRegress(weight ~ group)

pred.fR.D9 <- predict(fRegress.D9)
#  Now compare with 'lm'
lm.D9 <- lm(weight ~ group)
pred.lm.D9 <- predict(lm.D9)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(as.vector(pred.fR.D9), as.vector(pred.lm.D9))
## Don't show: 
)
## End(Don't show)

##
## vector response with functional explanatory variable
##
annualprec <- log10(apply(CanadianWeather$dailyAv[,,
                             "Precipitation.mm"], 2,sum))
smallbasis  <- create.fourier.basis(c(0, 365), 25)
tempfd <- smooth.basis(day.5,
       CanadianWeather$dailyAv[,,"Temperature.C"], smallbasis)$fd
precip.Temp.f <- fRegress(annualprec ~ tempfd)

#precip.Temp.p <- predict(precip.Temp.f, interval='confidence')
## Don't show: 
stopifnot(
## End(Don't show)
#class(precip.Temp.p) == 'matrix'
## Don't show: 
)
## End(Don't show)

## ***** not yet implemented *****

##
## Example using se.fit
##

#precip.Temp.p <- predict(precip.Temp.f, se.fit=TRUE)

## Don't show: 
stopifnot(
## End(Don't show)
#class(precip.Temp.p) == 'list'
## Don't show: 
)
## End(Don't show)

## ***** not yet implemented *****

###
###
### functional response with
###            (concurrent) functional explanatory variable
###
###
##
##  predict knee angle from hip angle;  from demo('gait', package='fda')
##
(gaittime <- as.numeric(dimnames(gait)[[1]])*20)
gaitrange <- c(0,20)
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
harmaccelLfd <- vec2Lfd(c(0, (2*pi/20)^2, 0), rangeval=gaitrange)
gaitfd <- smooth.basisPar(gaittime, gait,
       gaitbasis, Lfdobj=harmaccelLfd, lambda=1e-2)$fd
hipfd  <- gaitfd[,1]
kneefd <- gaitfd[,2]
knee.hip.f <- fRegress(kneefd ~ hipfd)

knee.hip.pred <- predict(knee.hip.f)
plot(knee.hip.pred)



