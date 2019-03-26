library(pROC)


### Name: roc.test
### Title: Compare the AUC of two ROC curves
### Aliases: roc.test roc.test.default roc.test.roc roc.test.formula
###   roc.test.auc roc.test.smooth.roc
### Keywords: multivariate nonparametric utilities htest roc

### ** Examples

data(aSAH)

# Basic example with 2 roc objects
roc1 <- roc(aSAH$outcome, aSAH$s100b)
roc2 <- roc(aSAH$outcome, aSAH$wfns)
roc.test(roc1, roc2)

## Not run: 
##D # The latter used Delong's test. To use bootstrap test:
##D roc.test(roc1, roc2, method="bootstrap")
##D # Increase boot.n for a more precise p-value:
##D roc.test(roc1, roc2, method="bootstrap", boot.n=10000)
## End(Not run)

# Alternative syntaxes
roc.test(aSAH$outcome, aSAH$s100b, aSAH$wfns)
roc.test(aSAH$outcome, data.frame(aSAH$s100b, aSAH$wfns))

# If we had a good a priori reason to think that wfns gives a
# better classification than s100b (in other words, AUC of roc1
# should be lower than AUC of roc2):
roc.test(roc1, roc2, alternative="less")

## Not run: 
##D # Comparison can be done on smoothed ROCs
##D # Smoothing is re-done at each iteration, and execution is slow
##D roc.test(smooth(roc1), smooth(roc2))
##D # or:
##D roc.test(aSAH$outcome, aSAH$s100b, aSAH$wfns, smooth=TRUE, boot.n=100)
## End(Not run)
# or from an AUC (no smoothing)
roc.test(auc(roc1), roc2)

## Not run: 
##D # Comparison of partial AUC:
##D roc3 <- roc(aSAH$outcome, aSAH$s100b, partial.auc=c(1, 0.8), partial.auc.focus="se")
##D roc4 <- roc(aSAH$outcome, aSAH$wfns, partial.auc=c(1, 0.8), partial.auc.focus="se")
##D roc.test(roc3, roc4)
##D # This is strictly equivalent to:
##D roc.test(roc3, roc4, method="bootstrap")
##D 
##D # Alternatively, we could re-use roc1 and roc2 to get the same result:
##D roc.test(roc1, roc2, reuse.auc=FALSE, partial.auc=c(1, 0.8), partial.auc.focus="se")
##D 
##D # Comparison on specificity and sensitivity
##D roc.test(roc1, roc2, method="specificity", specificity=0.9)
##D roc.test(roc1, roc2, method="sensitivity", sensitivity=0.9)
## End(Not run)

# Spurious use of DeLong's test with different direction:
roc5 <- roc(aSAH$outcome, aSAH$s100b, direction="<")
roc6 <- roc(aSAH$outcome, aSAH$s100b, direction=">")
roc.test(roc5, roc6, method="delong")

## Not run: 
##D # Comparisons of the ROC curves
##D roc.test(roc1, roc2, method="venkatraman")
## End(Not run)

# Unpaired tests
roc7 <- roc(aSAH$outcome, aSAH$s100b)
# artificially create an roc8 unpaired with roc7
roc8 <- roc(aSAH$outcome[1:100], aSAH$s100b[1:100])
## Not run: 
##D roc.test(roc7, roc8, paired=FALSE, method="delong")
##D roc.test(roc7, roc8, paired=FALSE, method="bootstrap")
##D roc.test(roc7, roc8, paired=FALSE, method="venkatraman")
##D roc.test(roc7, roc8, paired=FALSE, method="specificity", specificity=0.9)
## End(Not run)



