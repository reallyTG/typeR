library(rNMF)


### Name: rnmf
### Title: Robust Penalized Nonnegative Matrix Factorization (rNMF).
### Aliases: rnmf

### ** Examples

## Load a clean single simulated tumor image.
data("tumor")
image(tumor) # look at the tumor image
dim(tumor) # it is a '70 by 70' matrix
## Add 5% corruptions.
tumor.corrupted <- tumor
set.seed(1)
tumor.corrupted[sample(1:4900, round(0.05 * 4900), replace = FALSE)] <- 1
## Run rnmf with different settings
# No trimming
res.rnmf1 <- rnmf(X = tumor.corrupted, gamma = FALSE, my.seed = 1)
# 6 percent trimming, low dimension k = 5 (default)
res.rnmf2 <- rnmf(X = tumor.corrupted, tol = 0.001, gamma = 0.06, my.seed = 1)
# add sparsity constraint of H (beta = 0.1) with k = 10, and the "smooth" variation.
res.rnmf3 <- rnmf(X = tumor.corrupted, k = 10, beta = 0.1,
                  tol = 0.001, gamma = 0.06, my.seed = 1,
                  variation = "smooth", maxit = 30)

## Show results:
par(mfrow = c(2,2), mar = c(2,2,2,2))
image(tumor.corrupted, main = "Corrupted tumor image", xaxt = "n", yaxt = "n")
image(res.rnmf1$fit, main = "rnmf (no trimming) fit", xaxt = "n", yaxt = "n")
image(res.rnmf2$fit, main = "rnmf (cell) fit 2", xaxt = "n", yaxt = "n")
image(res.rnmf3$fit, main = "rnmf (smooth) fit 3", xaxt = "n", yaxt = "n")



