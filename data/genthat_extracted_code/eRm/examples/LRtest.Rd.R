library(eRm)


### Name: LRtest
### Title: Computation of Andersen's LR-test.
### Aliases: LRtest.Rm LRtest print.LR summary.LR plotGOF plotGOF.LR
### Keywords: models

### ** Examples

# the object used is the result of running ... RM(raschdat1)
res <- raschdat1_RM_fitted       # see ? raschdat1_RM_fitted

# LR-test on dichotomous Rasch model with user-defined split
splitvec <- sample(1:2, 100, replace = TRUE)
lrres <- LRtest(res, splitcr = splitvec)
lrres
summary(lrres)

## Not run: 
##D # goodness-of-fit plot with interactive labelling of items w/o standard errors
##D plotGOF(lrres, tlab = "identify")
## End(Not run)

# LR-test with a full raw-score split
X <- sim.rasch(1000, -2:2, seed = 5)
res2 <- RM(X)
full_lrt <- LRtest(res2, splitcr = "all.r")
full_lrt

## Not run: 
##D # LR-test with mean split, standard errors for beta's
##D lrres2 <- LRtest(res, split = "mean")
## End(Not run)

# to save computation time, the results are loaded from raschdat1_RM_lrres2
lrres2 <- raschdat1_RM_lrres2                    # see ?raschdat1_RM_lrres2

# goodness-of-fit plot
# additional 95 percent control line with user specified style
plotGOF(lrres2, ctrline = list(gamma = 0.95, col = "red", lty = "dashed"))

# goodness-of-fit plot for items 1, 14, 24, and 25
# additional 95 percent confidence ellipses, default style
plotGOF(lrres2, beta.subset = c(14, 25, 24, 1), conf = list())

## Not run: 
##D # goodness-of-fit plot for items 1, 14, 24, and 25
##D # for items 1 and 24 additional 95 percent confidence ellipses
##D # using colors for these 2 items from the colorspace package
##D library("colorspace")
##D my_colors <- rainbow_hcl(2)
##D plotGOF(lrres2, beta.subset = c(14, 25, 24, 1),
##D         conf = list(which = c(1, 14), col = my_colors))
## End(Not run)

# first, save current graphical parameters in an object
old_par <- par(mfrow = c(1, 2), no.readonly = TRUE)
# plots
plotGOF(lrres2, ctrline = list(gamma = 0.95, col = "red", lty = "dashed"),
  xlim = c(-3, 3), x_axis = FALSE, set_par = FALSE)
axis(1, seq(-3, 3, .5))

plotGOF(lrres2, conf = list(), xlim = c(-3, 3), x_axis = FALSE, set_par = FALSE)
axis(1, seq(-3, 3, .5))
text(-2, 2, labels = "Annotation")
# reset graphical parameters
par(old_par)



