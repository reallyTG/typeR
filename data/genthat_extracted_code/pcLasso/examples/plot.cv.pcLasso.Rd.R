library(pcLasso)


### Name: plot.cv.pcLasso
### Title: Plot the cross-validation curve produced by "cv.pcLasso" object
### Aliases: plot.cv.pcLasso

### ** Examples

set.seed(1)
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)
groups <- vector("list", 4)
for (k in 1:4) {
    groups[[k]] <- 5 * (k-1) + 1:5
}
cvfit <- cv.pcLasso(x, y, ratio = 0.8, groups = groups)
plot(cvfit)
# plot flipped: x-axis tracks -log(lambda) instead
plot(cvfit, sign.lambda = -1)

# if groups overlap, orignz can be used to decide which space to count the
# number of non-zero coefficients at the top
groups[[1]] <- 1:8
cvfit <- cv.pcLasso(x, y, ratio = 0.8, groups = groups)
plot(cvfit)                  # no. of non-zero coefficients in original space
plot(cvfit, orignz = FALSE)  # no. of non-zero coefficients in expanded space




