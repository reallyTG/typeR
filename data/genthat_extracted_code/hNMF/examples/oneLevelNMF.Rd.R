library(hNMF)


### Name: oneLevelNMF
### Title: Perform Non-Negative Matrix factorization
### Aliases: oneLevelNMF

### ** Examples


# random data
X <- matrix(runif(10*20), 10,20)

# run NMF with default algorithm, 5 runs with random initialization
NMFresult1 <- oneLevelNMF(X, rank=2, nruns=5)

# run NMF with specified algorithm and with initialized sources
W0 <- initializeSPA(X,3)
NMFresult2 <- oneLevelNMF(X, rank=3, method="HALSacc", initData = W0)



