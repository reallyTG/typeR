library(qualV)


### Name: timeTransME
### Title: Transformation of Time to Match Two Time Series
### Aliases: timeTransME timetransme print.timeTransME plot.timeTransME
###   summary.timeTransME
### Keywords: misc

### ** Examples

set.seed(123)
## a constructed example
x <- seq(0, 2*pi, length=10)
o <- 5 + sin(x) + rnorm(x, sd=0.2) # observation with random error
p <- 5 + sin(x-1)                  # simulation with time shift

# timeTransME(o, p) # reasonably accurate but takes very long!
# timeTransME(o, p, trials=5, debug=TRUE)

ttbeta <- timeTransME(o, p, trials=5)
plot(ttbeta)
## Not run: 
##D ttsimplex <- timeTransME(o, p, trans = transSimplex, trials=5)
##D plot(ttsimplex)
##D 
##D ttbezier <- timeTransME(o, p, trans = transBezier, trials=5)
##D plot(ttbezier)
## End(Not run)

## observed and measured data with non-matching time intervals
data(phyto)
bbobs    <- dpill(obs$t, obs$y)
n        <- diff(range(obs$t)) + 1
obss     <- ksmooth(obs$t, obs$y, kernel = "normal", bandwidth = bbobs,
            n.points = n)
names(obss) <- c("t", "y")
obss     <- as.data.frame(obss)[match(sim$t, obss$t), ]

tt       <- timeTransME(obss$y, sim$y, obss$t, sim$t, ME = SMSE,
            timeMEFactor = 0, time = "transform", type = "n", trials = 5)
round(tt$totalME, digits = 3)

basedate <- as.Date("1960/1/1")
plot(basedate + sim$t, sim$y, type="l", ylim = c(min(obs$y, sim$y),
  max(obs$y, sim$y)), xlab = "time", ylab = "Phytoplankton (mg/L)",
  col = 2, font = 2, lwd = 2, cex.lab = 1.2, las = 1)
lines(basedate + obss$t, obss$y, lwd = 2)
points(basedate + obs$t, obs$y, lwd = 2)
lines(basedate + tt$x, tt$yp, lwd = 2, col = 2, lty = 2)
legend(basedate + 12600, 50, c("measurement", "smoothed measurement",
"simulation", "transformed simulation"), lty = c(0, 1, 1, 2),
pch = c(1, NA, NA, NA), lwd = 2, col = c(1, 1, 2, 2))

tt1 <- timeTransME(obs$y, sim$y, obs$t, sim$t, ME = SMSLE, type = "n",
  time = "fixed")
tt1
plot(tt1)
summary(tt1)

## Not run: 
##D tt2 <- timeTransME(obss$y, sim$y, obss$t, sim$t, ME = SMSLE, type = "n",
##D   time = "trans", debug = TRUE)
##D tt2
##D plot(tt2)  # logarithm (SMSLE) is not appropriate for the example
##D summary(tt2)
##D tt3 <- timeTransME(obss$y, sim$y, obss$t, sim$t, ME = SMSE, type = "n",
##D   time = "trans", trans = transBezier, debug = TRUE)
##D tt3
##D plot(tt3)
##D summary(tt3)
##D tt4 <- timeTransME(obss$y, sim$y, obss$t, sim$t, ME = MSOE, type = "n",
##D   time = "trans", trans = transBezier, debug = TRUE)
##D tt4
##D plot(tt4)
##D summary(tt4)
## End(Not run)




