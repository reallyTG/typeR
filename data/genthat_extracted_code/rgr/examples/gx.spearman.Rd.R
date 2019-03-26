library(rgr)


### Name: gx.spearman
### Title: Display Spearman Correlation Coefficients and their
###   Significances
### Aliases: gx.spearman
### Keywords: multivariate nonparametric robust htest

### ** Examples

## Make test data available
data(sind.mat2open)

## Compute Spearman correlation coefficients
gx.spearman(sind.mat2open)

## Note, unlike gx.pearson there is no example with a log
## transformation.  The log transformation is monotonic
## and does not change the ranks

## Compute Spearmann correlation coefficients following
## a centred log-ratio transformation
gx.spearman(sind.mat2open, ifclr = TRUE)



