library(logcondens)


### Name: maxDiffCDF
### Title: Compute maximal difference between CDFs corresponding to
###   log-concave estimates
### Aliases: maxDiffCDF
### Keywords: htest nonparametric

### ** Examples

n1 <- 100
n2 <- 120
x <- sort(rgamma(n1, 2, 1))
y <- sort(rgamma(n2, 2, 1))
res1 <- logConDens(x, smoothed = TRUE)
res2 <- logConDens(y, smoothed = TRUE)
d <- maxDiffCDF(res1, res2, n.grid = 200)

## log-concave estimate
xs <- seq(min(res1$xs, res2$xs), max(res1$xs, res2$xs), length = 200)
F1 <- matrix(NA, nrow = length(xs), ncol = 1); F2 <- F1
for (i in 1:length(xs)){
    F1[i] <- evaluateLogConDens(xs[i], res1, which = 3)[, "CDF"]
    F2[i] <- evaluateLogConDens(xs[i], res2, which = 3)[, "CDF"]
    }
par(mfrow = c(1, 2))
plot(xs, abs(F1 - F2), type = "l")
abline(v = d$location[1], lty = 2, col = 3)
abline(h = d$test.stat[1], lty = 2, col = 3)

## smooth estimate
xs <- seq(min(res1$xs, res2$xs), max(res1$xs, res2$xs), length = 200)
F1smooth <- matrix(NA, nrow = length(xs), ncol = 2); F2smooth <- F1smooth
for (i in 1:length(xs)){
    F1smooth[i, ] <- evaluateLogConDens(xs[i], res1, which = 4:5)[, 
        c("smooth.density", "smooth.CDF")]
    F2smooth[i, ] <- evaluateLogConDens(xs[i], res2, which = 4:5)[, 
        c("smooth.density", "smooth.CDF")]
    }
plot(xs, abs(F1smooth[, 2] - F2smooth[, 2]), type = "l")
abline(h = 0)
abline(v = d$location[2], lty = 2, col = c(3, 4))
abline(h = d$test.stat[2], lty = 2, col = c(3, 4))



