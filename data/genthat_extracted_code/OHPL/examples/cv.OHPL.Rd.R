library(OHPL)


### Name: cv.OHPL
### Title: Cross-Validation for Ordered Homogeneity Pursuit Lasso
### Aliases: cv.OHPL

### ** Examples

data("wheat")

X = wheat$x
y = wheat$protein
n = nrow(wheat$x)

set.seed(1001)
samp.idx = sample(1L:n, round(n * 0.7))
X.cal = X[samp.idx, ]
y.cal = y[samp.idx]
X.test = X[-samp.idx, ]
y.test = y[-samp.idx]

# This needs to run for a while
## Not run: 
##D cv.fit = cv.OHPL(
##D   x, y, maxcomp = 6, gamma = seq(0.1, 0.9, 0.1),
##D   x.test, y.test, cv.folds = 5, G = 30, type = "max")
##D # the optimal G and gamma
##D cv.fit$opt.G
##D cv.fit$opt.gamma
## End(Not run)



