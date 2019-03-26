library(hdi)


### Name: lm.pval
### Title: Function to calculate p-values for ordinary multiple linear
###   regression.
### Aliases: lm.pval
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*5), nrow = 100, ncol = 5)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
pval <- lm.pval(x, y)
pval



