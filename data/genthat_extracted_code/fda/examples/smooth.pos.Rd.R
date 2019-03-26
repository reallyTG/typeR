library(fda)


### Name: smooth.pos
### Title: Smooth Data with a Positive Function
### Aliases: smooth.pos
### Keywords: smooth

### ** Examples

smallbasis  <- create.fourier.basis(c(0, 365), 65)
harmaccelLfd365 <- vec2Lfd(c(0,(2*pi/365)^2,0), c(0, 365))

index <- (1:35)[CanadianWeather$place == "Vancouver"]
VanPrec  <- CanadianWeather$dailyAv[,index, "Precipitation.mm"]

lambda    <- 1e4
dayfdPar <- fdPar(smallbasis, harmaccelLfd365, lambda)
smooth.pos(day.5, VanPrec, dayfdPar)




