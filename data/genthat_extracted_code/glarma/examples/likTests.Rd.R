library(glarma)


### Name: likTests
### Title: Likelihood Ratio Test and Wald Test for 'GLARMA' Fit
### Aliases: likTests likeTests print.likTests
### Keywords: Diagnostic

### ** Examples

data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])
glarmamod <- glarma(y, X, thetaLags = c(1,2,5), type = "Poi", method = "FS",
                    residuals = "Pearson", maxit = 100, grad = 2.22e-16)
likTests(glarmamod)
likeTests(glarmamod)



