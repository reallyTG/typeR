## ---- message = FALSE----------------------------------------------------
library(gnorm)

## ------------------------------------------------------------------------
set.seed(100)

## ---- fig.show='hold', fig.align = 'center', fig.width = 4, fig.height = 4----
xs <- seq(-1, 1, length.out = 100)
plot(xs, dgnorm(xs, mu = 0, alpha = sqrt(2), beta = 2), type = "l", 
     xlab = "x", ylab = expression(p(x)))

## ---- fig.show='hold', fig.align = 'center', fig.width = 4, fig.height = 4----
xs <- seq(-1, 1, length.out = 100)
plot(xs, pgnorm(xs, 0, sqrt(2), 2), type = "l", xlab = "q", ylab = expression(paste("Pr(", x<=q, ")", sep = "")))

## ---- fig.show='hold', fig.align = 'center', fig.width = 4, fig.height = 4----
xs <- seq(0, 1, length.out = 100)
plot(xs, qgnorm(xs, 0, sqrt(2), 2), type = "l", xlab = "p", ylab = expression(paste("q: p = Pr(", x<=q, ")", sep = "")))

## ---- fig.show='hold', fig.align = 'center', fig.width = 4, fig.height = 4----
xs <- rgnorm(100, 0, sqrt(2), 2)
hist(xs, xlab = "x", freq = FALSE, main = "Histogram of Draws")

