library(ACSWR)


### Name: mfp
### Title: Psychological Tests for Males and Females
### Aliases: mfp
### Keywords: hypothesis testing for equality of covariance matrices

### ** Examples

data(mfp)
males <- mfp[,1:4]; females <- mfp[,5:8]
nm <- nrow(males);nf <- nrow(females)
p <- 4; k <- 2
vm <- nm-1; vf <- nf-1
meanm <- colMeans(males); meanf <- colMeans(females)
sigmam <- var(males); sigmaf <- var(females)
sigmapl <- (1/(nm+nf-2))*((nm-1)*sigmam+(nf-1)*sigmaf)
ln_M <- .5*(vm*log(det(sigmam))+vf*log(det(sigmaf))) -.5*(vm+vf)*log(det(sigmapl))
exact_test <- -2*ln_M # the Exact Test
exact_test



