library(fbroc)


### Name: boot.roc
### Title: Bootstrap ROC curve
### Aliases: boot.roc

### ** Examples

y <- rep(c(TRUE, FALSE), each = 500)
x <- rnorm(1000) + y
result.boot <- boot.roc(x, y)



