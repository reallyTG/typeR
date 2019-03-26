library(cgam)


### Name: cgam
### Title: Constrained Generalized Additive Model Fitting
### Aliases: cgam
### Keywords: cgam routine

### ** Examples

# Example 1.
  data(cubic)
  # extract x
  x <- cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with no restriction with lm()
  fit.lm <- lm(y ~ x + I(x^2) + I(x^3))

  # regress y on x under the restriction: "increasing and convex"
  fit.cgam <- cgam(y ~ incr.conv(x))

  # make a plot to compare the two fits
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fit.cgam$muhat, col = 2, lty = 2)
  lines(x, fitted(fit.lm), col = 1, lty = 1)
  legend("topleft", bty = "n", c("constrained cgam fit", "unconstrained lm fit"), 
  lty = c(2, 1), col = c(2, 1))

# Example 2.
## Not run: 
##D   library(gam)
##D   data(kyphosis)
##D   
##D   # regress Kyphosis on Age, Number, and Start under the restrictions:
##D   # "concave", "increasing and concave", and "decreasing and concave" 
##D   fit <- cgam(Kyphosis ~ conc(Age) + incr.conc(Number) + decr.conc(Start), 
##D   family = binomial(), data = kyphosis) 
## End(Not run)

# Example 3.
  library(MASS)
  data(Rubber)
  
  # regress loss on hard and tens under the restrictions:
  # "decreasing" and "decreasing"
  fit.cgam <- cgam(loss ~ decr(hard) + decr(tens), data = Rubber)
  # "smooth and decreasing" and "smooth and decreasing"
  fit.cgam.s <- cgam(loss ~ s.decr(hard) + s.decr(tens), data = Rubber)
  summary(fit.cgam.s)
  anova(fit.cgam.s)
  
  # make a 3D plot based on fit.cgam and fit.cgam.s
  plotpersp(fit.cgam, th = 120, main = "3D Plot of a Cgam Fit")
  plotpersp(fit.cgam.s, tens, hard, data = Rubber, th = 120, main = "3D Plot of a Smooth Cgam Fit")

# Example 4. monotonic variance estimation
  n <- 400
  x <- runif(n)
  sig <- .1 + exp(15*x-8)/(1+exp(15*x-8))
  e <- rnorm(n)
  mu <- 10*x^2
  y <- mu + sig*e

  fit <- cgam(y ~ s.incr.conv(x), var.est = s.incr(x))
  est.var <- fit$vh
  muhat <- fit$muhat

  par(mfrow = c(1, 2))
  plot(x, y)
  points(sort(x), muhat[order(x)], type = "l", lwd = 2, col = 2)
  lines(sort(x), (mu)[order(x)], col = 4)

  plot(sort(x), est.var[order(x)], col=2, lwd=2, type="l", 
  lty=2, ylab="Variance", ylim=c(0, max(c(est.var, sig^2))))
  points(sort(x), (sig^2)[order(x)], col=1, lwd=2, type="l")

# Example 5. monotonic variance estimation with the lidar data set in SemiPar
  library(SemiPar)
  data(lidar)

  fit <- cgam(logratio ~ s.decr(range), var.est=s.incr(range), data=lidar)
  muhat <- fit$muhat
  est.var <- fit$vh
  
  logratio <- lidar$logratio
  range <- lidar$range
  pfit <- predict(fit, newData=data.frame(range=range), interval="confidence", level=0.95)
  upp <- pfit$upper
  low <- pfit$lower
  
  par(mfrow = c(1, 2))
  plot(range, logratio)
  points(sort(range), muhat[order(range)], type = "l", lwd = 2, col = 2)
  lines(sort(range), upp[order(range)], type = "l", lwd = 2, col = 4)
  lines(sort(range), low[order(range)], type = "l", lwd = 2, col = 4)
  title("Smoothly Decreasing Fit with a Point-Wise Confidence Interval", cex.main=0.5)
  
  plot(range, est.var, col=2, lwd=2, type="l",lty=2, ylab="variance")
  title("Smoothly Increasing Variance", cex.main=0.5)



