library(pROC)


### Name: var.roc
### Title: Variance of a ROC curve
### Aliases: var var.roc var.auc var.smooth.roc var.default
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

##  Basic example
roc1 <- roc(aSAH$outcome, aSAH$s100b)
roc2 <- roc(aSAH$outcome, aSAH$wfns)
var(roc1)
var(roc2)

# We could also write it in one line:
var(roc(aSAH$outcome, aSAH$s100b))

## Not run: 
##D # The latter used Delong. To use bootstrap:
##D var(roc1, method="bootstrap")
##D # Decrease boot.n for a faster execution
##D var(roc1,method="bootstrap", boot.n=1000)
## End(Not run)

# To use obuchowski:
var(roc1, method="obuchowski")

## Not run: 
##D # Variance of smoothed ROCs:
##D # Smoothing is re-done at each iteration, and execution is slow
##D var(smooth(roc1))
## End(Not run)

# or from an AUC (no smoothing)
var(auc(roc1))

## Test data from Hanley and Hajian-Tilaki, 1997
disease.present <- c("Yes", "No", "Yes", "No", "No", "Yes", "Yes", "No",
                     "No", "Yes", "No", "No", "Yes", "No", "No")
field.strength.1 <- c(1, 2, 5, 1, 1, 1, 2, 1, 2, 2, 1, 1, 5, 1, 1)
field.strength.2 <- c(1, 1, 5, 1, 1, 1, 4, 1, 2, 2, 1, 1, 5, 1, 1)
roc3 <- roc(disease.present, field.strength.1)
roc4 <- roc(disease.present, field.strength.2)
# Assess the variance:
var(roc3)
var(roc4)

## Not run: 
##D # With bootstrap:
##D var(roc3, method="bootstrap")
##D var(roc4, method="bootstrap")
## End(Not run)




