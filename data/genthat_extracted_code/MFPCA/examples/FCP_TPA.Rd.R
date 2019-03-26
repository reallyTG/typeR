library(MFPCA)


### Name: FCP_TPA
### Title: The functional CP-TPA algorithm
### Aliases: FCP_TPA

### ** Examples

 # set.seed(1234)
 
 N <- 100
 S1 <- 75
 S2 <- 75

 # define "true" components
 v <- sin(seq(-pi, pi, length.out = S1))
 w <- exp(seq(-0.5, 1, length.out = S2))
 
 # simulate tensor data with dimensions N x S1 x S2
 X <- rnorm(N, sd = 0.5) %o% v %o% w
 
 # create penalty matrices (penalize first differences for each dimension)
 Pv <- crossprod(diff(diag(S1)))
 Pw <- crossprod(diff(diag(S2)))
 
 # estimate one eigentensor
 res <- FCP_TPA(X, K = 1, penMat = list(v = Pv, w = Pw),
             alphaRange = list(v = c(1e-4, 1e4), w = c(1e-4, 1e4)),
             verbose = TRUE)
 
 # plot the results and compare to true values
 plot(res$V)
 points(v/sqrt(sum(v^2)), pch = 20)
 legend("topleft", legend = c("True", "Estimated"), pch = c(20, 1))
 
 plot(res$W)
 points(w/sqrt(sum(w^2)), pch = 20)
 legend("topleft", legend = c("True", "Estimated"), pch = c(20, 1))



