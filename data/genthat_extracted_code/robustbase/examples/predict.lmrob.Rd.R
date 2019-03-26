library(robustbase)


### Name: predict.lmrob
### Title: Predict method for Robust Linear Model ("lmrob") Fits
### Aliases: predict.lmrob
### Keywords: robust regression

### ** Examples

## Predictions --- artificial example -- closely following  example(predict.lm)

set.seed(5)
n <- length(x <- sort(c(round(rnorm(25), 1), 20)))
y <- x + rnorm(n)
iO <- c(sample(n-1, 3), n)
y[iO] <- y[iO] + 10*rcauchy(iO)

p.ex <- function(...) {
  plot(y ~ x, ...); abline(0,1, col="sky blue")
  points(y ~ x, subset=iO, col="red", pch=2)
  abline(lm   (y ~ x), col = "gray40")
  abline(lmrob(y ~ x), col = "forest green")
  legend("topleft", c("true", "Least Squares", "robust"),
         col = c("sky blue", "gray40", "forest green"), lwd=1.5, bty="n")
}
p.ex()

fm <- lmrob(y ~ x)
predict(fm)
new <- data.frame(x = seq(-3, 10, 0.25))
str(predict(fm, new, se.fit = TRUE))
pred.w.plim <- predict(fm, new, interval = "prediction")
pred.w.clim <- predict(fm, new, interval = "confidence")
pmat <- cbind(pred.w.clim, pred.w.plim[,-1])

matlines(new$x, pmat, lty = c(1,2,2,3,3))# add to first plot
## show zoom-in region :
rect(xleft = -3, ybottom = -20, xright = 10, ytop = 40,
     lty = 3, border="orange4")

## now zoom in :
p.ex(xlim = c(-3,10), ylim = c(-20, 40))
matlines(new$x, pmat, lty = c(1,2,2,3,3))
box(lty = 3, col="orange4", lwd=3)
legend("bottom", c("fit", "lwr CI", "upr CI", "lwr Pred.I", "upr Pred.I"),
       col = 1:5, lty=c(1,2,2,3,3), bty="n")

## Prediction intervals, special cases
##  The first three of these throw warnings
w <- 1 + x^2
fit <- lmrob(y ~ x)
wfit <- lmrob(y ~ x, weights = w)
predict(fit,       interval = "prediction")
predict(wfit,      interval = "prediction")
predict(wfit, new, interval = "prediction")
predict(wfit, new, interval = "prediction", weights = (new$x)^2) -> p.w2
p.w2
stopifnot(identical(p.w2, ## the same as using formula:
     predict(wfit, new, interval = "prediction", weights = ~x^2)))



