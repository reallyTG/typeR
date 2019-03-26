library(ebdbNet)


### Name: calcAUC
### Title: Calculate the Approximate Area Under the Curve (AUC)
### Aliases: calcAUC
### Keywords: methods

### ** Examples

library(ebdbNet)
tmp <- runif(1) ## Initialize random number generator

## Generate artificial values for sensitivity and complementary specificity.
fn <- function(x) {return(-1/(x^7)+1)}
set.seed(1459)
sens <- c(fn(seq(1, 2.7, length = 100)),1) ## Sensitivity
cspec <- seq(0, 1, by = 0.01) ## Complementary specificity

## Calculate the AUC of the ROC curve
AUC <- calcAUC(sens, cspec) ## AUC of this ROC curve is 0.9030868



