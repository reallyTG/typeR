library(epibasix)


### Name: mcNemar
### Title: Pair-Matched Analysis Tool
### Aliases: mcNemar print.mcNemar summary.mcNemar
### Keywords: multivariate design

### ** Examples

## Not run: 
##D Data for matched-cohort study, comparing smokers to non-smokers for the presence
##D of lung cancer.
## End(Not run)
X <- cbind(c(15,5), c(19,61));
summary(mcNemar(X, alpha=0.05, force=TRUE));



