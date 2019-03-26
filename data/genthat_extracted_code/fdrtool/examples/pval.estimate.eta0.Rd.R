library(fdrtool)


### Name: pval.estimate.eta0
### Title: Estimate the Proportion of Null p-Values
### Aliases: pval.estimate.eta0
### Keywords: htest

### ** Examples

# load "fdrtool" library and p-values
library("fdrtool")
data(pvalues)


# Proportion of null p-values for different methods
pval.estimate.eta0(pvalues, method="conservative")
pval.estimate.eta0(pvalues, method="adaptive")
pval.estimate.eta0(pvalues, method="bootstrap")
pval.estimate.eta0(pvalues, method="smoother")
pval.estimate.eta0(pvalues, method="quantile")



