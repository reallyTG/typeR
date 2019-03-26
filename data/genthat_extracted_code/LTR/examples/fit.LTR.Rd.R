library(LTR)


### Name: fit.LTR
### Title: Fit a linear-transformation of replicates model
### Aliases: fit.LTR
### Keywords: models

### ** Examples

x <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
y <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
model.fit <- fit.LTR(x, y);



