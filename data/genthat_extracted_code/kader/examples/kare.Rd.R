library(kader)


### Name: kare
### Title: Kernel Adaptive Regression Estimator
### Aliases: kare

### ** Examples

require(stats)

 # Regression function:
m <- function(x, x1 = 0, x2 = 8, a = 0.01, b = 0) {
 a * (x - x1) * (x - x2)^3 + b
}
 # Note: For a few details on m() see examples in ?nadwat.

x0 <- 5   # The point x_0 at which the MSE-optimal kernel adjusted
 # nonparametric estimation of m should take place. (Recall: for m's
 # default values a minimum is at 2, a point of inflection at 4, and
 # a saddle point an 8; an "arbitrary" point would, e.g., be at 5.)

n <- 100   # Sample size.
sdeps <- 1   # Std. dev. of the \epsilon_i: \sqrt(Var(Y|X=x))
             # (here: constant in x).
design.ctr <- x0 + 0.5   # "centre" and "scale" of the design, i.e.,
design.scl <- 1  # in the normal scenario below, expected value and
                 # std. dev. of the distribution of the x_i's.

set.seed(42)   # To guarantee reproducibility.
x <- rnorm(n, mean = design.ctr, sd = design.scl)   # x_1, ..., x_n
Y <- m(x) + rnorm(length(x), sd = sdeps)            # Y_1, ..., Y_n
data <- data.frame(x = x, y = Y)

 # Computing the kernel adaptive regression estimator values
 #**********************************************************
x.points <- seq(-3.3 * design.scl, 3.3 * design.scl, length = 101) +
   design.ctr  # x-grid on which to draw and estimate the regr. fct. m.

Sigma <- seq(0.01, 10, length = 51)   # \sigma-grid for minimization.
fit <- kare(x.points = x0, data = data, Sigma = Sigma)

## Not run: 
##D  # Grafical display for the current data set
##D  #******************************************
##D  # Storing the curent settings of the graphics device
##D  # and changing its layout for the three plots to come:
##D op <- par(mfrow = c(3, 1), mar = c(3, 3, 2, 0.1)+0.1,
##D    mgp = c(1.5, 0.5, 0), tcl = -0.3, cex.main = 2)
##D 
##D  # The scatter plot of the "raw data":
##D plot(y ~ x, data = data, xlim = range(data$x, x.points),
##D    ylim = range(data$y, fit$y, na.rm = TRUE),
##D    main = bquote(n == .(n)), xlab = "x", ylab = "y")
##D 
##D  # The "true" regression function m:
##D lines(x.points, m(x.points), lty = 2)
##D 
##D  # The MSE-optimal kernel adjusted nonparametric regression estimator
##D  # at x_0, i.e., the point (x_0, \hat m_n(x_0)):
##D points(fit$x, fit$y, col = "red", pch = 4, cex = 2)
##D 
##D  # The legend for the "true" regression function m and for the point
##D  # (x_0, \hat m_n(x_0)):
##D legend("topleft", lty = c(2, NA), pch = c(NA, 4),
##D  col = c("black", "red"), bty = "n", cex = 1.2,
##D  legend = c(as.expression(bquote(paste("m  with  ",
##D                                        sigma(paste(Y, "|", X == x))
##D                                  == .(sdeps)))),
##D             as.expression(bquote(paste(hat(m)[n](x[0]), "  at  ",
##D                                        x[0] == .(x0))))))
##D 
##D  # Visualizing the estimators of (Bias_n(sigma))^2 and
##D  # Var_n(sigma) at x0 on the sigma-grid:
##D with(fit,
##D   matplot(Sigma, cbind(Bn*Bn, Vn2), type = "l", lty = 1:2,
##D    col = c("black", "red"), xlab = expression(sigma), ylab = ""))
##D 
##D  # The legend for (Bias_n(sigma))^2 and Var_n(sigma):
##D legend("topleft", lty = 1:2, col = c("black", "red"), bty = "n",
##D   legend = c(expression(paste(widehat(plain(Bias))[n]^2, (sigma))),
##D              expression(widehat(plain(Var))[n](sigma))),
##D   cex = 1.2)
##D 
##D  # Visualizing the estimator of MSE_n(sigma) at x0 on the sigma-grid
##D  # together with the point indicating the detected minimum, and a legend:
##D plot(fit$Sigma, fit$MSE, type = "l",
##D  xlab = expression(sigma), ylab = "")
##D points(fit$sigma.adap, fit$msehat.min, pch = 4, col = "red", cex = 2)
##D legend("topleft", lty = c(1, NA), pch = c(NA, 4),
##D  col = c("black", "red"), bty = "n", cex = 1.2,
##D  legend = c(expression(widehat(plain(MSE))[n](sigma)),
##D             substitute(group("(", list(plain(Minimizer),
##D                                        plain(Minimum)), ")")
##D                          == group("(", list(x, y), ")"),
##D                        list(x = signif(fit$sigma.adap, 4),
##D                             y = signif(fit$msehat.min, 4)))))
##D 
##D par(op) # Restoring the previous settings of the graphics device.
## End(Not run)




