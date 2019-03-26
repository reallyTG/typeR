library(pcLasso)


### Name: cv.pcLasso
### Title: Cross-validation for pcLasso
### Aliases: cv.pcLasso

### ** Examples

set.seed(1)
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)
groups <- vector("list", 4)
for (k in 1:4) {
    groups[[k]] <- 5 * (k-1) + 1:5
}
cvfit1 <- cv.pcLasso(x, y, groups = groups, ratio = 0.8)

# change no. of CV folds
cvfit2 <- cv.pcLasso(x, y, groups = groups, ratio = 0.8, nfolds = 5)
# specify which observations are in each fold
foldid <- sample(rep(seq(5), length = length(y)))
cvfit3 <- cv.pcLasso(x, y, groups = groups, ratio = 0.8, foldid = foldid)

# keep=TRUE to have pre-validated fits and foldid returned
cvfit4 <- cv.pcLasso(x, y, groups = groups, ratio = 0.8, keep = TRUE)




