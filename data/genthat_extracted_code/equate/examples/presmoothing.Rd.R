library(equate)


### Name: presmoothing
### Title: Frequency Distribution Presmoothing
### Aliases: presmoothing presmoothing.default presmoothing.formula
###   loglinear freqbump freqavg
### Keywords: models smooth

### ** Examples


set.seed(2010)
x <- round(rnorm(1000, 100, 15))
xscale <- 50:150
xtab <- freqtab(x, scales = xscale)

# Adjust frequencies
plot(xtab, y = cbind(average = freqavg(xtab),
  bump = freqbump(xtab)))

# Smooth x up to 8 degrees and choose best fitting model
# based on aic minimization
xlog1 <- loglinear(xtab, degrees = 8,
  choose = TRUE, choosemethod = "aic")
plot(xtab, as.data.frame(xlog1)[, 2],
  legendtext = "degree = 3")

# Add "teeth" and "gaps" to x
# Smooth with formula interface
teeth <- c(.5, rep(c(1, 1, 1, 1, .5), 20))
xttab <- as.freqtab(cbind(xscale, c(xtab) * teeth))
xlog2 <- presmoothing(~ poly(total, 3, raw = TRUE),
  xttab, showWarnings = FALSE)

# Smooth xt using score functions that preserve 
# the teeth structure (also 3 moments)
teeth2 <- c(1, rep(c(0, 0, 0, 0, 1), 20))
xt.fun <- cbind(xscale, xscale^2, xscale^3)
xt.fun <- cbind(xt.fun, teeth2, xt.fun * teeth2)
xlog3 <- loglinear(xttab, xt.fun, showWarnings = FALSE)

# Plot to compare teeth versus no teeth
op <- par(no.readonly = TRUE)
par(mfrow = c(3, 1))
plot(xttab, main = "unsmoothed", ylim = c(0, 30))
plot(xlog2, main = "ignoring teeth", ylim = c(0, 30))
plot(xlog3, main = "preserving teeth", ylim = c(0, 30))
par(op)

# Bivariate example, preserving first 3 moments of total
# and anchor for x and y, and the covariance
# between anchor and total
# see equated scores in Wang (2009), Table 4
xvtab <- freqtab(KBneat$x, scales = list(0:36, 0:12))
yvtab <- freqtab(KBneat$y, scales = list(0:36, 0:12))
Y <- as.data.frame(yvtab)[, 1]
V <- as.data.frame(yvtab)[, 2]
scorefun <- cbind(Y, Y^2, Y^3, V, V^2, V^3, V*Y)
wang09 <- equate(xvtab, yvtab, type = "equip",
  method = "chained", smooth = "loglin",
  scorefun = scorefun)
wang09$concordance

# Removing impossible scores has essentially no impact
xvlog1 <- loglinear(xvtab, scorefun, asfreqtab = FALSE)
xvlog2 <- loglinear(xvtab, scorefun, rmimpossible = 1:2)
plot(xvtab, cbind(xvlog1,
	xvlog2 = as.data.frame(xvlog2)[, 3]))




