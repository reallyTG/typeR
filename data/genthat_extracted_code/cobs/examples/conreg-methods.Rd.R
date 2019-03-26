library(cobs)


### Name: conreg-methods
### Title: Summary Methods for 'conreg' Objects
### Aliases: fitted.conreg residuals.conreg knots.conreg lines.conreg
###   plot.conreg predict.conreg print.conreg
### Keywords: print models

### ** Examples

example(conreg, echo = FALSE)
class(rc) # "conreg"
rc # calls the print method
knots(rc)
plot(rc)
## and now _force_ the not-quite-concave cubic spline :
plot(rc, force.iSpl=TRUE)

xx <- seq(-0.1, 1.1, length=201) # slightly extrapolate
## Get function s(x)  and first derivative  s'(x) :
yx <- predict(rc, xx)
y1 <- predict(rc, xx, deriv = 1)

op <- par(las=1)
plot(xx, yx, type = "l",
     main="plot(xx,  predict( conreg(.), xx))")
par(new=TRUE) # draw the first derivative "on top"
plot(xx, y1, type = "l", col = "blue",
     axes = FALSE, ann = FALSE)
abline(h = 0, lty="1A", col="blue")
axis(4, col="blue", col.axis="blue", col.ticks="blue")
mtext("first derivative s'(.)", col="blue")
par(op)



