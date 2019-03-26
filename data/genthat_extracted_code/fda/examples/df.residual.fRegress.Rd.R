library(fda)


### Name: df.residual.fRegress
### Title: Degress of Freedom for Residuals from a Functional Regression
### Aliases: df.residual.fRegress
### Keywords: models

### ** Examples

##
## example from help('lm')
##
     ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
     trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
     group <- gl(2,10,20, labels=c("Ctl","Trt"))
     weight <- c(ctl, trt)
fRegress.D9 <- fRegress(weight ~ group)
dfr.D9 <- df.residual(fRegress.D9)

# Check the answer manually
lm.D9 <- lm(weight ~ group)
dfr.D9l <- df.residual(lm.D9)
attr(dfr.D9l, 'nobs') <- length(predict(lm.D9))
attr(dfr.D9l, 'df.model') <- 2
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dfr.D9, dfr.D9l)
## Don't show: 
)
## End(Don't show)

##
## functional response with (concurrent) functional explanatory variable
##
# *** NOT IMPLEMENTED YET FOR FUNCTIONAL RESPONSE
#     BUT WILL EVENTUALLY USE THE FOLLOWING EXAMPLE:

(gaittime <- as.numeric(dimnames(gait)[[1]])*20)
gaitrange <- c(0,20)
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
harmaccelLfd <- vec2Lfd(c(0, (2*pi/20)^2, 0), rangeval=gaitrange)
gaitfd <- smooth.basisPar(gaittime, gait,
       gaitbasis, Lfdobj=harmaccelLfd, lambda=1e-2)$fd
hipfd  <- gaitfd[,1]
kneefd <- gaitfd[,2]

knee.hip.f <- fRegress(kneefd ~ hipfd)

#knee.hip.dfr <- df.residual(knee.hip.f)


# Check the answer
#kh.dfr <- knee.hip.f$df ???





