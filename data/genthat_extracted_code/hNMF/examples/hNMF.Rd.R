library(hNMF)


### Name: hNMF
### Title: Hierarchical non-negative matrix factorization.
### Aliases: hNMF

### ** Examples


# create nmfInput object
X <- matrix(runif(10*20), 10,20)
bgImageTensor <- array(0,dim=dim(X))
selectVect <- array(1,dim=dim(X))
nmfInput <- NULL
nmfInput$numRows <- nrow(X)
nmfInput$numCols <- ncol(X)
nmfInput$numSlices <- 1
nmfInput$bgImageTensor <- bgImageTensor
nmfInput$selectVect <- selectVect

# run NMF with default algorithm, 5 runs with random initialization
NMFresult1 <- oneLevelNMF(X, rank=2, nruns=5)

# run NMF with specified algorithm and with initialized sources
W0 <- initializeSPA(X,3)
NMFresult2 <- oneLevelNMF(X, rank=3, method="HALSacc", initData = W0)



