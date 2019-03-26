library(ccaPP)


### Name: permTest
### Title: (Robust) permutation test for no association
### Aliases: permTest
### Keywords: multivariate robust

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
permTest(x, y, R = 100, method = "spearman")
permTest(x, y, R = 100, method = "spearman", consistent = TRUE)

## Pearson correlation
permTest(x, y, R = 100, method = "pearson")



