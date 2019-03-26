library(stepR)


### Name: stepsel
### Title: Automatic selection of number of jumps
### Aliases: stepsel stepsel.MRC stepsel.AIC stepsel.BIC
### Keywords: nonparametric

### ** Examples

# simulate 5 blocks (4 jumps) within a total of 100 data points
b <- c(sort(sample(1:99, 4)), 100)
f <- rep(rnorm(5, 0, 4), c(b[1], diff(b)))
rbind(b = b, f = unique(f))
# add gaussian noise
y <- f + rnorm(100)
# find 10 candidate jumps
path <- steppath(y, max.cand = 10)
# select number of jumps by simulated MRC with sqrt-penalty
# thresholded with positive delta, and by BIC
sel.MRC <- stepsel(path, y, "MRC", alpha = 0.05, r = 1e2, penalty = "sqrt")
sel.MRC
delta <- .1
sel.delta <- stepsel(path, y, "MRC",
  q = (1 + delta) * sdrobnorm(y) * sqrt(2 * length(y)), penalty = "none")
sel.delta
sel.BIC <- stepsel(path, type="BIC")
sel.BIC
# compare results with truth
fit.MRC <- path[[sel.MRC]]
as.data.frame(fit.MRC)
as.data.frame(path[[sel.delta]])
as.data.frame(path[[sel.BIC]])



