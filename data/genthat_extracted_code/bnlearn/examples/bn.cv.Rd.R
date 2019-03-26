library(bnlearn)


### Name: bn.cv
### Title: Cross-validation for Bayesian networks
### Aliases: bn.cv plot.bn.kcv plot.bn.kcv.list loss
### Keywords: resampling

### ** Examples

bn.cv(learning.test, 'hc', loss = "pred", loss.args = list(target = "F"))

folds = list(1:2000, 2001:3000, 3001:5000)
bn.cv(learning.test, 'hc', loss = "logl", method = "custom-folds",
  folds = folds)

xval = bn.cv(gaussian.test, 'mmhc', method = "hold-out",
         k = 5, m = 50, runs = 2)
xval
loss(xval)

## Not run: 
##D # comparing algorithms with multiple runs of cross-validation.
##D gaussian.subset = gaussian.test[1:50, ]
##D cv.gs = bn.cv(gaussian.subset, 'gs', runs = 10)
##D cv.iamb = bn.cv(gaussian.subset, 'iamb', runs = 10)
##D cv.inter = bn.cv(gaussian.subset, 'inter.iamb', runs = 10)
##D plot(cv.gs, cv.iamb, cv.inter,
##D   xlab = c("Grow-Shrink", "IAMB", "Inter-IAMB"), connect = TRUE)
##D 
##D # use custom folds.
##D folds = split(sample(nrow(gaussian.subset)), seq(5))
##D bn.cv(gaussian.subset, "hc", method = "custom-folds", folds = folds)
##D 
##D # multiple runs, with custom folds.
##D folds = replicate(5, split(sample(nrow(gaussian.subset)), seq(5)),
##D           simplify = FALSE)
##D bn.cv(gaussian.subset, "hc", method = "custom-folds", folds = folds)
## End(Not run)


