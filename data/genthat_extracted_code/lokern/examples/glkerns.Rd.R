library(lokern)


### Name: glkerns
### Title: Kernel Regression Smoothing with Adaptive Plug-in Bandwidth
### Aliases: glkerns glkerns.default glkerns.formula
### Keywords: smooth

### ** Examples

data(xSim)## linear plus an exponential peak, see help(xSim)
n <- length(xSim)
tt <- ((1:n) - 1/2)/n # equidistant x ==> is.rand = FALSE
gk <- glkerns(tt, xSim, is.rand = FALSE)
gk # print method
plot(gk) # nice plot() method
if(require("sfsmisc")) {
  TA.plot(gk)
} else { plot(residuals(gk) ~ fitted(gk)); abline(h = 0, lty=2) }
qqnorm(residuals(gk), ylab = "residuals(gk)")

cat("glkerns() bandwidth:",format(gk$bandwidth, dig=10),"\n")
## local bandwidth: fit is very similar :
(lk <- lokerns(tt, xSim, is.rand = FALSE))
nobs(lk)

cols <- c(gl="PaleGreen", lo="Firebrick")
plot(lk$x.out, lk$bandwidth, axes = FALSE, xlab="", ylab="",
     ylim=c(0,max(lk$bandwidth)), type="h", col = "gray90")
axis(4); mtext("bandwidth(s)", side=4)
lines(lk$x.out, lk$bandwidth, col = cols["lo"], lty = 3)
abline(     h = gk$bandwidth, col = cols["gl"], lty = 4)
par(new=TRUE)
plot(tt, xSim, main = "global and local bandwidth kernel regression")
lines(gk$x.out, gk$est, col = cols["gl"], lwd = 1.5)
lines(lk$x.out, lk$est, col = cols["lo"])
# the red curve (local bw) is very slightly better
legend(0.7,4.4, c("global bw","local bw"), col = cols, lwd=1)

## This should look
op <- par(mfrow = c(3,1), mar = .1 + c(4,4,2,1), oma = c(0,0,3,0),
          mgp = c(1.5, 0.6,0))
plot(gk, main = expression(paste("Data & ", hat(f))))
## calling extra plot() method
gk1 <- glkerns(tt, xSim, deriv = 1, is.rand = FALSE)
plot(gk1$x.out, gk1$est, col = "green", lwd = 1.5, type = "l",
     main = expression(widehat(paste(f,"'"))))
abline(h=0, col="gray", lty = 3)
gk2 <- glkerns(tt, xSim, deriv = 2, is.rand = FALSE)
plot(gk2$x.out, gk2$est, col = "orange", lwd = 1.5, type = "l",
     main = expression(widehat(paste(f,"''"))))
abline(h=0, col="gray", lty = 3)
mtext("Example from www.unizh.ch/biostat/..../kernf77.html",side=3,
      outer = TRUE, cex = 1, font = par("font.main"))

par(op)
data(cars)
plot(dist ~ speed, data = cars,
     main = "Global Plug-In Bandwidth")
## these two are equivalent
m1glk <- glkerns(dist ~ speed, data = cars)
m.glk <- glkerns(cars$ speed, cars$ dist)
lines(m.glk, col=2) # using the lines() method
mtext(paste("bandwidth = ", format(m.glk$bandwidth, dig = 4)))
ii <- names(m1glk) != "call"
stopifnot(all.equal(m1glk[ii], m.glk[ii], tol = 1e-15))



