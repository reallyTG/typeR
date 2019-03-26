library(SkewHyperbolic)


### Name: lrnokeur
### Title: Log Returns of the NOK/EUR Exchange Rate
### Aliases: lrnokeur
### Keywords: datasets

### ** Examples

##Fit the skew hyperbolic students-t distribution to the data
data(lrnokeur)
fit <- skewhypFit(lrnokeur, method = "nlm", plot = TRUE, print = TRUE)



