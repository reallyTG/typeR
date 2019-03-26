library(cobs)


### Name: interpSplineCon
### Title: (Cubic) Interpolation Spline from "conreg"
### Aliases: interpSplineCon isIsplineCon
### Keywords: smooth utilities

### ** Examples

cc <- conreg(cars[,"speed"], cars[,"dist"], convex=TRUE)
iS <- interpSplineCon(cc)
(isC <- isIsplineCon(cc)) # FALSE: not strictly convex
## Passing the interpolation spline --- if you have it anyway ---
## is more efficient (faster) :
stopifnot(identical(isC,
                    isIsplineCon(cc, isp = iS)))

## the interpolation spline is not quite convex:
plot(cc)
with(cars, points(dist ~ speed, col = adjustcolor(1, 1/2)))
lines(predict(iS, seq(1,28, by=1/4)),
      col = adjustcolor("forest green", 3/4), lwd=2)



