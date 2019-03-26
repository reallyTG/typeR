library(spm)


### Name: pred.acc
### Title: Predictive error and accuracy measures for predictive models
###   based on cross-validation
### Aliases: pred.acc

### ** Examples

set.seed(1234)
x <- sample(1:30, 30)
e <- rnorm(30, 1)
y <- x + e
pred.acc(x, y)

y <- 0.8 * x + e
pred.acc(x, y)




