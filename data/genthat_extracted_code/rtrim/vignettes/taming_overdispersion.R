## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7,
  fig.height = 5
)
rm(list=ls())

## ------------------------------------------------------------------------
library(rtrim)
data(oystercatcher)

# Collect all raw count data
ok <- is.finite(oystercatcher$count) & oystercatcher$count > 0
count <- oystercatcher$count[ok]
plot(count, type='p', pch=16, col="red", cex=0.4)

## ------------------------------------------------------------------------
count <- sort(count)
plot(count/1000, type='p', pch=16, col="red", cex=0.4, las=TRUE, ylab="count (x1000)")

## ------------------------------------------------------------------------
cum_count <- cumsum(sort(count, decreasing = TRUE)) # cumulative counts, largest first
cum_pct <- 100 * cum_count / sum(count)             # express as percentage of total
n <- length(count)
obs_pct <- 100 * (1:n)/n
plot(obs_pct, cum_pct, type='n', xlab="Observations (%)", ylab="Cum. counts (%)", las=1)
points(obs_pct, cum_pct, pch=16, cex=0.3, col="red")
abline(a=100, b=-1, lty="dashed")
grid()

## ------------------------------------------------------------------------
oystercatcher2 <- subset(oystercatcher, year>=2005)

calc_coverage <- function(x) 100*mean(is.finite(x) & x>0)
coverage <- aggregate(count ~ site, data=oystercatcher2, calc_coverage, na.action=na.pass)
coverage <- coverage[order(coverage$count, decreasing=TRUE), ]
plot(coverage$count, ylab="coverage (%)", pch=16, col=gray(0,0.5), las=1)
abline(a=50, b=0, col="red")

## ------------------------------------------------------------------------
ok <- subset(coverage, count > 45)
oystercatcher3 <- subset(oystercatcher2, site %in% ok$site)

## ------------------------------------------------------------------------
z <- trim(count ~ site + (year+month), data=oystercatcher3, model=3, overdisp=TRUE)
summary(z)


## ------------------------------------------------------------------------
# Retrieve raw observed and modelled counts
out <- results(z)
ok  <- is.finite(out$observed)
f   <- out$observed[ok]
mu  <- out$fitted[ok]

# Compute Pearson residuals, and sort
r <- (f - mu) / sqrt(mu)
idx <- order(r^2, decreasing=TRUE)
r <- r[idx]

# How many obervations and parameters?
n <- length(f)
p <- z$nsite + z$nyear-1 + z$nmonth-1

# Set up
skips <- 0 : (n %/% 2) # skip none to approx 50% of all residuals
sig2 <- numeric(length(skips)) # Allocate a vector with the computed overdispersion
for (i in seq_along(skips)) {
  r2 <- r[skips[i] : n]^2
  df <- n - p - skips[i] # correct for skipped
  sig2[i] <- sum(r2) / df
}
plot(skips, sig2, type='l', col="red", las=1)
abline(h=0.0, lty="dashed", col="red")

## ------------------------------------------------------------------------
sig2_alt1 <- numeric(length(skips))
for (i in seq_along(skips)) {
  rr <- r[skips[i] : n]
  df <- n - p - skips[i] # correct for skipped
  sig2_alt1[i] <- (sum(abs(rr))/df)^2
}
plot(skips, sig2, type='l', col="red", las=1)
lines(skips, sig2_alt1, col="blue")

## ------------------------------------------------------------------------
# residuals, and their square
r <- (f - mu) / sqrt(mu)
r2 <- r^2

# classic overdispersion
n <- length(f)
p <- z$nsite + z$nyear-1 + z$nmonth-1
sig2_std <- sum(r^2) / (n-p)

# Compute interquantile distance and outlier limits
Q <- quantile(r2, c(0.25, 0.50, 0.75)) # such that Q[3] is what you expect
IQR <- (Q[3]-Q[1]) # Interquartile range
k <- 3 # Tuckey's criterion for "far out"
lo <- Q[1] - k * IQR # low threshold value added for completeless only
hi <- Q[3] + k * IQR
cat(sprintf("Using r2 limit %f -- %f\n", lo, hi))
nlo <- sum(r2<lo)
cat(sprintf("  removing %d lower outliers (%.1f%%)\n", nlo, 100*nlo/length(f)))
nhi <- sum(r2>hi)
cat(sprintf("  removing %d upper outliers (%.1f%%)\n", nhi, 100*nhi/length(f)))
ok <- (r2>lo) & (r2<hi)
df <- length(r2) - p
sig2_alt2 <- sum(r2[ok]) / df
cat(sprintf("Reduced sig2 from %.1f to %.1f\n", sig2_std, sig2_alt2))

## ---- eval=FALSE---------------------------------------------------------
#  z <- trim(..., overdisp=TRUE, constrain_overdisp=3, ...)

## ------------------------------------------------------------------------
level <- 0.99
niter <- 10
sig2_alt3 <- numeric(niter)
ok <- !logical(length(r2)) # all TRUE
for (i in 1:niter) {
  # Compute current overdispersion
  df <- sum(ok) - p
  sig2_alt3[i] <- sum(r2[ok]) / df
  # Compute new cutoff value
  cutoff <- sig2_alt3[i] * qchisq(level, 1) 
  ok <- r2 < cutoff
}
ntotal <- length(r2)
noutlier <- ntotal - sum(ok)
cat(sprintf("Removed %d outliers (%.1f%%)\n", noutlier, 100*noutlier/ntotal))
plot(sig2_alt3, type='l', col="red", ylim=range(0,range(sig2_alt3)), las=1)
points(sig2_alt3, pch=16, col="red")
text(25,400, sprintf("Convergence at %.1f", sig2_alt3[niter]))

## ---- eval=FALSE---------------------------------------------------------
#  z <- trim(..., overdisp=TRUE, constrain_overdisp=0.99, ...)

## ------------------------------------------------------------------------
z1 <- trim(count ~ site + (year+month), data=oystercatcher3, model=3,
           overdisp=TRUE, constrain_overdisp=0.99)
z2 <- trim(count ~ site + (year+month), data=oystercatcher3, model=3,
           overdisp=TRUE, constrain_overdisp=1)
idx1 <- index(z1)
idx2 <- index(z2)
plot(idx1, idx2, names=c("constrained","unconstrained"))

