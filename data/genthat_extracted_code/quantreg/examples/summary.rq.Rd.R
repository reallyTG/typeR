library(quantreg)


### Name: summary.rq
### Title: Summary methods for Quantile Regression
### Aliases: summary.rq summary.rqs summary.rcrqs
### Keywords: regression

### ** Examples

data(stackloss)
y <- stack.loss
x <- stack.x
summary(rq(y ~ x, method="fn")) # Compute se's for fit using "nid" method.
summary(rq(y ~ x, ci=FALSE),se="ker")
# default "br" alg, and compute kernel method se's



