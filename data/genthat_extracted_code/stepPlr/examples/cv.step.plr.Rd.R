library(stepPlr)


### Name: cv.step.plr
### Title: Computes cross-validated deviance or prediction errors for
###   step.plr
### Aliases: cv.step.plr
### Keywords: models regression

### ** Examples

n <- 100
p <- 5
x <- matrix(sample(seq(3), n * p, replace=TRUE), nrow=n)
y <- sample(c(0, 1), n, replace=TRUE)
level <- vector("list", length=p)
for (i in 1:p) level[[i]] <- seq(3)
cvfit <- cv.step.plr(x, y, level=level, lambda=c(1e-4, 1e-2, 1), cp="bic")



