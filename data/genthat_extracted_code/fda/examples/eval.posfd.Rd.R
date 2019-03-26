library(fda)


### Name: eval.posfd
### Title: Evaluate a Positive Functional Data Object
### Aliases: eval.posfd predict.posfd fitted.posfd residuals.posfd
### Keywords: smooth

### ** Examples

harmaccelLfd <- vec2Lfd(c(0,(2*pi/365)^2,0), c(0, 365))
smallbasis   <- create.fourier.basis(c(0, 365), 65)
index        <- (1:35)[CanadianWeather$place == "Vancouver"]
VanPrec      <- CanadianWeather$dailyAv[,index, "Precipitation.mm"]
lambda       <- 1e4
dayfdPar     <- fdPar(smallbasis, harmaccelLfd, lambda)
VanPrecPos   <- smooth.pos(day.5, VanPrec, dayfdPar)
#  compute fitted values using eval.posfd()
VanPrecPosFit1 <- eval.posfd(day.5, VanPrecPos$Wfdobj)
#  compute fitted values using predict()
VanPrecPosFit2 <- predict(VanPrecPos, day.5)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(VanPrecPosFit1, VanPrecPosFit2)
## Don't show: 
)
## End(Don't show)
#  compute fitted values using fitted()
VanPrecPosFit3 <- fitted(VanPrecPos)
#  compute residuals
VanPrecRes <- resid(VanPrecPos)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(VanPrecRes, VanPrecPos$y-VanPrecPosFit3)
## Don't show: 
)
## End(Don't show)




