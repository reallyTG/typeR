library(pROC)


### Name: cov.roc
### Title: Covariance of two paired ROC curves
### Aliases: cov cov.default cov.auc cov.smooth.roc cov.roc
### Keywords: multivariate nonparametric utilities roc

### ** Examples

data(aSAH)

# Basic example with 2 roc objects
roc1 <- roc(aSAH$outcome, aSAH$s100b)
roc2 <- roc(aSAH$outcome, aSAH$wfns)
cov(roc1, roc2)

## Not run: 
##D # The latter used Delong. To use bootstrap:
##D cov(roc1, roc2, method="bootstrap")
##D # Decrease boot.n for a faster execution:
##D cov(roc1, roc2, method="bootstrap", boot.n=1000)
## End(Not run)

# To use Obuchowski:
cov(roc1, roc2, method="obuchowski")

## Not run: 
##D # Comparison can be done on smoothed ROCs
##D # Smoothing is re-done at each iteration, and execution is slow
##D cov(smooth(roc1), smooth(roc2))
## End(Not run)
# or from an AUC (no smoothing)
cov(auc(roc1), roc2)

## Not run: 
##D # With bootstrap and return.values, one can compute the variances of the
##D # ROC curves in one single bootstrap run:
##D cov.rocs <- cov(roc1, roc2, method="bootstrap", boot.return=TRUE)
##D # var(roc1):
##D var(attr(cov.rocs, "resampled.values")[,1])
##D # var(roc2):
##D var(attr(cov.rocs, "resampled.values")[,2])
## End(Not run)

## Not run: 
##D # Covariance of partial AUC:
##D roc3 <- roc(aSAH$outcome, aSAH$s100b, partial.auc=c(1, 0.8), partial.auc.focus="se")
##D roc4 <- roc(aSAH$outcome, aSAH$wfns, partial.auc=c(1, 0.8), partial.auc.focus="se")
##D cov(roc3, roc4)
##D # This is strictly equivalent to:
##D cov(roc3, roc4, method="bootstrap")
##D 
##D # Alternatively, we could re-use roc1 and roc2 to get the same result:
##D cov(roc1, roc2, reuse.auc=FALSE, partial.auc=c(1, 0.8), partial.auc.focus="se")
## End(Not run)

# Spurious use of DeLong's test with different direction:
roc5 <- roc(aSAH$outcome, aSAH$s100b, direction="<")
roc6 <- roc(aSAH$outcome, aSAH$s100b, direction=">")
cov(roc5, roc6, method="delong")

## Test data from Hanley and Hajian-Tilaki, 1997
disease.present <- c("Yes", "No", "Yes", "No", "No", "Yes", "Yes", "No",
                     "No", "Yes", "No", "No", "Yes", "No", "No")
field.strength.1 <- c(1, 2, 5, 1, 1, 1, 2, 1, 2, 2, 1, 1, 5, 1, 1)
field.strength.2 <- c(1, 1, 5, 1, 1, 1, 4, 1, 2, 2, 1, 1, 5, 1, 1)
roc7 <- roc(disease.present, field.strength.1)
roc8 <- roc(disease.present, field.strength.2)
# Assess the covariance:
cov(roc7, roc8)

## Not run: 
##D # With bootstrap:
##D cov(roc7, roc8, method="bootstrap")
## End(Not run)




