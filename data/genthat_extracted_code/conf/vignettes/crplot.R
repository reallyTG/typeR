## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
library(conf)
ballbearing <- c(17.88, 28.92, 33.00, 41.52, 42.12, 45.60, 48.48, 51.84,
                 51.96, 54.12, 55.56, 67.80, 68.64, 68.64, 68.88, 84.12,
                 93.12, 98.64, 105.12, 105.84, 127.92, 128.04, 173.40)
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull") 

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", 
       pts = FALSE, sf = c(2, 4), ylas = 1, origin = TRUE)

## ---- fig.height = 4, fig.width = 4, fig.keep = 'none'-------------------
x <- crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", info = TRUE)
names(x)

## ---- fig.height = 4, fig.width = 3.5, fig.show = 'asis'-----------------
# with confidence region data stored in x, it is now available for custom graphics
plot(x$kappa, x$lambda, type = 'l', lty = 5, xlim = c(0, 3), ylim = c(0, 0.0163),
     xlab = expression(kappa), ylab = expression(lambda))
polygon(x$kappa, x$lambda, col = "gray80", border = NA)

## ---- fig.show = 'hold'--------------------------------------------------
# record MLE values (previously output to screen when info = TRUE) & reproduce CR plot
kappa.hat <- 2.10206
lambda.hat <- 0.01221
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", xlab = "shape", 
       ylab = " ", main = paste0("Confidence Region"),
       pts = FALSE, mlelab = FALSE, sf = c(2, 4), origin = TRUE)
par(xpd = TRUE)
text(-1.2, 0.007, "scale", srt = 90)

# 1st analysis plot: overlay phi angles (as line segments) on the confidence region plot
par(xpd = FALSE)
segments(rep(kappa.hat, length(x$phi)), rep(lambda.hat, length(x$phi)),
         x1 = kappa.hat * cos(x$phi) + kappa.hat, y1 = kappa.hat * sin(x$phi) + lambda.hat, lwd = 0.2)

# 2nd analysis plot: CDF of phi angles reveals most are very near 0 (2pi) and pi
plot.ecdf(x$phi, pch = 20, cex = 0.1, axes = FALSE, xlab = expression(phi), ylab = "", main = "CDF")
axis(side = 1, at = round(c(0, pi, 2*pi), 2))
axis(side = 2, at = c(0, 1), las = 2)

## ---- fig.show = 'hold'--------------------------------------------------
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", ylas = 1,
       maxdeg = 3, main = "maxdeg = 3", sf = c(5, 5))
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", ylas = 1,
       maxdeg = 3, main = "maxdeg = 3 (pts hidden)", sf = c(5, 5), pts = FALSE)
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", ylas = 1,
       maxdeg = 20, main = "maxdeg = 20", sf = c(5, 5))
crplot(dataset = ballbearing, alpha = 0.05, distn = "weibull", ylas = 1,
       maxdeg = 20, main = "maxdeg = 20 (pts hidden)", sf = c(5, 5), pts = FALSE)

## ---- fig.show = 'hold'--------------------------------------------------
crplot(dataset = ballbearing, alpha = 0.05, distn = "invgauss", sf = c(2, 2),
       ylas = 1, main = "default; heuristic = 1")
crplot(dataset = ballbearing, alpha = 0.05, distn = "invgauss", sf = c(2, 2), 
       ylas = 1, heuristic = 0, ellipse_n = 100, main = "heuristic = 0")

## ---- fig.show = 'hold'--------------------------------------------------
crplot(dataset = ballbearing, alpha = 0.05, distn = "invgauss", sf = c(2, 2),
       heuristic = 0, ellipse_n = 40, main = "combination: step 1")
crplot(dataset = ballbearing, alpha = 0.05, distn = "invgauss", sf = c(2, 2), 
       maxdeg = 10, ellipse_n = 40, main = "combination: step 2")

## ---- fig.show = 'hold'--------------------------------------------------
crplot(dataset = ballbearing, alpha = 0.05, distn = "invgauss", sf = c(2, 2), 
       maxdeg = 10, main = "default (heuristic = 1)")

## ---- fig.show = 'hold', fig.height = 3.8, fig.width = 4-----------------
mp6_obs <- c(6, 6, 6, 7, 10, 13, 16, 22, 23)                # time of cancer remission
mp6_cen <- c(6, 9, 10, 11, 17, 19, 20, 25, 32, 32, 34, 35)  # right-censored time
mp6 <- c(mp6_obs, mp6_cen)
cen <- c(rep(1, length(mp6_obs)), rep(0, length(mp6_cen)))
crplot(dataset = mp6, alpha = 0.05, distn = "weibull", cen = cen, sf = c(4, 4))

## ---- fig.show = 'hold', warning = FALSE---------------------------------
X <- seq(1, 2.5, by = 0.25)
crplot(dataset = X, alpha = 0.01, distn = "gamma", sf = c(2, 2), pts = FALSE, repair = FALSE, main = "without repair")
x <- crplot(seq(1, 2.5, by = 0.25), 0.01, "gamma", sf = c(2, 2), info = TRUE, repair = FALSE, main = "without repair")
index1 <- which(x$kappa == max(x$kappa))
index2 <- which(x$theta == max(x$theta))
lines(c(x$thetahat, x$theta[index1]), c(x$kappahat, x$kappa[index1]), col = "red")
lines(c(x$thetahat, x$theta[index2]), c(x$kappahat, x$kappa[index2]), col = "red")

## ---- fig.show = 'hold', warning = FALSE---------------------------------
crplot(seq(1, 2.5, by = 0.25), 0.01, "gamma", sf = c(2, 2), pts = FALSE, main = "with repair")
crplot(seq(1, 2.5, by = 0.25), 0.01, "gamma", sf = c(2, 2), main = "with repair", showjump = TRUE)
lines(c(x$thetahat, x$theta[index1]), c(x$kappahat, x$kappa[index1]), col = "red")
lines(c(x$thetahat, x$theta[index2]), c(x$kappahat, x$kappa[index2]), col = "red")

## ---- fig.show = 'hold', warning = FALSE---------------------------------
crplot(seq(1, 2.5, by = 0.25), 0.01, "gamma", sf = c(2, 2), pts = TRUE, main = "max(theta) zoom", xlim = c(1.25, 1.5), ylim = c(1.4, 2.4))
crplot(seq(1, 2.5, by = 0.25), 0.01, "gamma", sf = c(2, 2), pts = TRUE, main = "max(kappa) zoom", xlim = c(0.04, 0.05), ylim = c(37, 41))

## ---- fig.show = 'hold', warning = FALSE---------------------------------
  x <- crplot(c(2, 2.5), 0.01, "llogis", sf = c(2, 2), info = TRUE, pts = FALSE, main = "llogis")
  x <- crplot(c(2, 2.5), 0.01, "weibull", sf = c(2, 2), info = TRUE, pts = FALSE, main = "weibull")
  x <- crplot(c(2, 2.5), 0.01, "norm", sf = c(2, 2), info = TRUE, pts = FALSE, main = "norm")

