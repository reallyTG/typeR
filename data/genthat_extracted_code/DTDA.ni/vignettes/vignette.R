## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=T, fig.align='center',message = FALSE, fig.height = 4, fig.width = 6, warning = FALSE----

# Loading the package:
library(DTDA.ni)

# Generating data which are doubly truncated:
N <- 250
x0 <- runif(N)           # Original data
u0 <- runif(N, -0.25, 0.5) # Left-truncation times
tau <- 0.75               # Interval width
v0 <- u0 + tau

x <- x0[u0 <= x0 & x0 <= v0]
u <- u0[u0 <= x0 & x0 <= v0]
v <- v0[u0 <= x0 & x0 <= v0]
n <- length(x)  # Final sample size after the interval sampling

# Create an object wit DTDAni function
res <- DTDAni(x, u, tau)
plot(res, ecdf = FALSE) # Plot without ecdf (Default)
abline(a = 0, b = 1, col = "green")  # The true cumulative distribution


## ---- eval=T, fig.align='center',message = FALSE, fig.height = 4, fig.width = 6, warning = FALSE----
# Calculating the reverse estimator:
plot(res)

res2 <- DTDAni(-x, -u - 0.75, 0.75)
abline(a = 0, b = 1, col = "green") 
lines(-res2$x, 1 - res2$cumprob, type = "s", col = "blue", lty = 2)


## ---- eval=T, fig.align='center',message = FALSE, fig.height = 4, fig.width = 6, warning = FALSE----
# Weigthed estimator (recommended):

w <- 1/2

k <- length(res$x)

Fw <- w * res$cumprob + (1 - w) * (1 - res2$cumprob[k:1])

plot(res)
abline(a = 0, b = 1, col = "green") 
lines(-res2$x, 1 - res2$cumprob, type = "s", col = "blue", lty = 2)
lines(res$x, Fw, type = "s", col = 2)


# Using res$P and res$L to compute the estimator:

k <- length(res$x)
F <- rep(1, k)
for (i in 2:k) {
F[i] <- (F[i - 1] - res$P[i - 1]) / res$L[i - 1] + res$P[i - 1]
}

F0 <- F / max(F)  # This is equal to res$cumprob

