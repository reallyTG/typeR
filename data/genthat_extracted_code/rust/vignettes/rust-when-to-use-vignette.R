## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

required <- c("bang")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)

## ---- fig.show='hold'----------------------------------------------------
library(rust)
alpha <- 0.1
max_phi <- qgamma(0.999, shape = alpha)
ptr_gam <- create_xptr("logdgamma")
lambda <- find_lambda_one_d_rcpp(logf = ptr_gam, alpha = alpha,
                                 max_phi = max_phi)
# Box-Cox transformation parameter
lambda$lambda
gam <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1000, trans = "BC",
               lambda = lambda)
plot(gam, xlab = "x")
plot(gam, ru_scale = TRUE, xlab = "y")

## ------------------------------------------------------------------------
ptr_c <- create_xptr("logcauchy")
cauchy1 <- ru_rcpp(logf = ptr_c, log = TRUE, init = 0, r = 1, n = 1000)
cauchy126 <- ru_rcpp(logf = ptr_c, log = TRUE, init = 0, r = 1.26, n = 1000)
cbind(cauchy1$box, cauchy126$box)
c(cauchy1$pa, cauchy126$pa)

## ---- fig.show='hold'----------------------------------------------------
library(bang)
coag1 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2], n = 10000)
coag2 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2], n = 10000,
                 param = "original", r = 1)
probs <- c(2.5, 25, 50, 75, 97.5) / 100
all1 <- cbind(coag1$theta_sim_vals, coag1$sim_vals)
all2 <- cbind(coag2$theta_sim_vals, coag2$sim_vals)
round(t(apply(all1, 2, quantile, probs = probs)), 1)
round(t(apply(all2, 2, quantile, probs = probs)), 1)

## ------------------------------------------------------------------------
coag1$pa
coag2$pa

## ---- fig.show='hold'----------------------------------------------------
normal_mixture <- function(x, mu, p) {
  return(log(p * dnorm(x) + (1 - p) * dnorm(x, mean = mu)))
}

res1 <- ru(logf = normal_mixture, mu = 10, p = 0.25, init = -1, n = 10000)
plot(res1, main = "(a)")
res2 <- ru(logf = normal_mixture, mu = 10, p = 0.25, init = 11, n = 10000)
plot(res2, main = "(b)")
res3 <- ru(logf = normal_mixture, mu = 4, p = 0.25, init = 5, n = 10000)
plot(res3, main = "(c)")
res3$pa
res4 <- ru(logf = normal_mixture, mu = 4, p = 0.25, init = -1, n = 10000)
plot(res4, main = "(d)")

