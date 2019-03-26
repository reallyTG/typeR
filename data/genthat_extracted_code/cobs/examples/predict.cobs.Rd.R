library(cobs)


### Name: predict.cobs
### Title: Predict method for COBS Fits
### Aliases: predict.cobs
### Keywords: regression

### ** Examples

example(cobs) # continuing :
(pRbs <- predict(Rbs))
#str(pSbs <- predict(Sbs, xx, interval = "both"))
str(pSbs <- predict(Sbs, xx, interval = "none"))

plot(x,y, xlim = range(xx), ylim = range(y, pSbs[,2], finite = TRUE),
     main = "COBS Median smoothing spline, automatical lambda")
lines(pSbs, col = "red")
lines(spline(x,f.true), col = "gray40")
#matlines(pSbs[,1], pSbs[,-(1:2)],
#         col= rep(c("green","blue"),c(2,2)), lty=2)



