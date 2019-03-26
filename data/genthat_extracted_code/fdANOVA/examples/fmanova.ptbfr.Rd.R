library(fdANOVA)


### Name: fmanova.ptbfr
### Title: Permutation Tests Based on a Basis Function Representation for
###   FMANOVA Problem
### Aliases: fmanova.ptbfr
### Keywords: Multivariate Test

### ** Examples

# Some of the examples may run some time.

# gait data (both features)
library(fda)
gait.data.frame <- as.data.frame(gait)
x.gait <- vector("list", 2)
x.gait[[1]] <- as.matrix(gait.data.frame[, 1:39])
x.gait[[2]] <- as.matrix(gait.data.frame[, 40:78])

# vector of group labels
group.label.gait <- rep(1:3, each = 13)
## No test: 
# the tests based on a basis function representation with default parameters
set.seed(123)
(fmanova1 <- fmanova.ptbfr(x.gait, group.label.gait))
summary(fmanova1)

# the tests based on a basis function representation with non-default parameters
set.seed(123)
fmanova2 <- fmanova.ptbfr(x.gait, group.label.gait, int = c(0.025, 0.975), B = 5000,
                          basis = "b-spline", criterion = "eBIC", commonK = "mean",
                          minK = 5, maxK = 20, norder = 4, gamma.eBIC = 0.7)
summary(fmanova2)

# the tests based on a basis function representation
# with predefined basis function representation
library(fda)
fbasis <- create.fourier.basis(c(0, nrow(x.gait[[1]])), 17)
own.basis <- vector("list", 2)
own.basis[[1]] <- Data2fd(1:nrow(x.gait[[1]]), x.gait[[1]], fbasis)$coefs
own.basis[[2]] <- Data2fd(1:nrow(x.gait[[2]]), x.gait[[2]], fbasis)$coefs
own.cross.prod.mat <- diag(rep(1, 17))
set.seed(123)
fmanova3 <- fmanova.ptbfr(group.label = group.label.gait,
                          B = 1000, basis = "own",
                          own.basis = own.basis,
                          own.cross.prod.mat = own.cross.prod.mat)
summary(fmanova3)

library(fda)
fbasis <- create.bspline.basis(c(0, nrow(x.gait[[1]])), 20, norder = 4)
own.basis <- vector("list", 2)
own.basis[[1]] <- Data2fd(1:nrow(x.gait[[1]]), x.gait[[1]], fbasis)$coefs
own.basis[[2]] <- Data2fd(1:nrow(x.gait[[2]]), x.gait[[2]], fbasis)$coefs
own.cross.prod.mat <- inprod(fbasis, fbasis)
set.seed(123)
fmanova4 <- fmanova.ptbfr(group.label = group.label.gait,
                          B = 1000, basis = "own",
                          own.basis = own.basis,
                          own.cross.prod.mat = own.cross.prod.mat)
summary(fmanova4)
## End(No test)
## Don't show: 
# the tests based on a basis function representation with non-default parameters
fmanova2 <- fmanova.ptbfr(x.gait, group.label.gait, int = c(0.025, 0.975), B = 5,
                          basis = "b-spline", criterion = "eBIC", commonK = "mean",
                          minK = 5, maxK = 20, norder = 4, gamma.eBIC = 0.7)

# the tests based on a basis function representation
# with predefined basis function representation
fbasis <- create.fourier.basis(c(0, nrow(x.gait[[1]])), 17)
own.basis <- vector("list", 2)
own.basis[[1]] <- Data2fd(1:nrow(x.gait[[1]]), x.gait[[1]], fbasis)$coefs
own.basis[[2]] <- Data2fd(1:nrow(x.gait[[2]]), x.gait[[2]], fbasis)$coefs
own.cross.prod.mat <- diag(rep(1, 17))
fmanova3 <- fmanova.ptbfr(group.label = group.label.gait,
                          B = 10, basis = "own",
                          own.basis = own.basis,
                          own.cross.prod.mat = own.cross.prod.mat)

fbasis <- create.bspline.basis(c(0, nrow(x.gait[[1]])), 20, norder = 4)
own.basis <- vector("list", 2)
own.basis[[1]] <- Data2fd(1:nrow(x.gait[[1]]), x.gait[[1]], fbasis)$coefs
own.basis[[2]] <- Data2fd(1:nrow(x.gait[[2]]), x.gait[[2]], fbasis)$coefs
own.cross.prod.mat <- inprod(fbasis, fbasis)
fmanova4 <- fmanova.ptbfr(group.label = group.label.gait,
                          B = 10, basis = "own",
                          own.basis = own.basis,
                          own.cross.prod.mat = own.cross.prod.mat)
## End(Don't show)



