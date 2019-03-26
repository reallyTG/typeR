library(partDSA)


### Name: partDSA
### Title: partDSA
### Aliases: partDSA DSA.control
### Keywords: utilities

### ** Examples

library(MASS)
set.seed(6442)

n <- nrow(Boston)
tr.n <- floor(n / 2)
train.index <- sample(1:n, tr.n, replace=FALSE)
test.index <- (1:n)[-train.index]

x <- Boston[train.index, -14]
y <- Boston[train.index, 14]
x.test <- Boston[test.index, -14]
y.test <- Boston[test.index, 14]

control <- DSA.control(vfold=1)  # no cross-validation
partDSA(x, y, x.test=x.test, y.test=y.test, control=control)



