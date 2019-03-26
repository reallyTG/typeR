library(pROC)


### Name: multiclass.roc
### Title: Multi-class AUC
### Aliases: multiclass.roc multiclass.roc.default multiclass.roc.formula
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Basic example
multiclass.roc(aSAH$gos6, aSAH$s100b)
# Produces an innocuous warning because one level has no observation

# Select only 3 of the aSAH$gos6 levels:
multiclass.roc(aSAH$gos6, aSAH$s100b, levels=c(3, 4, 5))

# Give the result in percent
multiclass.roc(aSAH$gos6, aSAH$s100b, percent=TRUE)






