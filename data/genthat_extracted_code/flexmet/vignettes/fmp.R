## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(flexmet)

## ---- autodep=TRUE-------------------------------------------------------
## example parameters from Table 7 of Reise & Waller (2003)
a <- c(0.57, 0.68, 0.76, 0.72, 0.69, 0.57, 0.53, 0.64,
       0.45, 1.01, 1.05, 0.50, 0.58, 0.58, 0.60, 0.59,
       1.03, 0.52, 0.59, 0.99, 0.95, 0.39, 0.50)
b <- c(0.87, 1.02, 0.87, 0.81, 0.75, -0.22, 0.14, 0.56,
       1.69, 0.37, 0.68, 0.56, 1.70, 1.20, 1.04, 1.69,
       0.76, 1.51, 1.89, 1.77, 0.39, 0.08, 2.02)

## convert from difficulties and discriminations to FMP parameters

b1 <- 1.702 * a
b0 <- - 1.702 * a * b
bmat <- cbind(b0, b1) 

## ------------------------------------------------------------------------
# generate a large number of theta and TRF (thetastar) values
theta <- seq(-3, 5, length = 5000)
TRF <- rowSums(irf_fmp(theta = theta, b = bmat))

## ------------------------------------------------------------------------
fmp0 <- MonoPoly::monpol(theta ~ TRF, K = 0)
fmp1 <- MonoPoly::monpol(theta ~ TRF, K = 1)
fmp2 <- MonoPoly::monpol(theta ~ TRF, K = 2)
fmp3 <- MonoPoly::monpol(theta ~ TRF, K = 3)
fmp4 <- MonoPoly::monpol(theta ~ TRF, K = 4)

## ------------------------------------------------------------------------
fmp0$RSS
fmp1$RSS
fmp2$RSS
fmp3$RSS
fmp4$RSS

## ---- fig.height = 6, fig.width = 7--------------------------------------
cols <- c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00")
par(lwd = 2)
curve(0*x, xlim = c(0, 22), ylim = c(-1, 1), col = "darkgray",
      xlab = "Expected Sum Score", 
      ylab = "Residuals of Polynomial Approximation")

points(TRF, residuals(fmp0), type = 'l', col = cols[1], lty = 2)
points(TRF, residuals(fmp1), type = 'l', col = cols[2], lty = 3)
points(TRF, residuals(fmp2), type = 'l', col = cols[3], lty = 2)
points(TRF, residuals(fmp3), type = 'l', col = cols[4], lty = 1)
points(TRF, residuals(fmp4), type = 'l', col = cols[5], lty = 3)

legend("bottomright",
       legend = c(expression(paste(italic(k[theta])," = 0")),
                  expression(paste(italic(k[theta])," = 1")),
                  expression(paste(italic(k[theta])," = 2")),
                  expression(paste(italic(k[theta])," = 3")),
                  expression(paste(italic(k[theta])," = 4"))),
       col = cols, lty = c(2, 3, 2, 1, 3), bty = "n")

## ------------------------------------------------------------------------
(tvec <- coef(fmp3))

## ------------------------------------------------------------------------
bstarmat <- t(apply(bmat, 1, transform_b, tvec = tvec))

## inspect transformed parameters
signif(head(bstarmat), 2)


## ---- fig.height=5, fig.width=5, fig.align="center"----------------------
par(pty = "s")
curve(rowSums(irf_fmp(x, bmat = bstarmat)), xlim = c(0, 23),
      ylim = c(0, 23), xlab = expression(paste(theta,"*")),
      ylab = "Expected Sum Score")
abline(0, 1, col = 2)

