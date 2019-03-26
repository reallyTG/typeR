library(gMWT)


### Name: getSigTests
### Title: Extract Significant Test Results for a Given Alpha or Different
###   Multiple Testing Corrections.
### Aliases: getSigTests
### Keywords: methods

### ** Examples

  X <- matrix(c(rnorm(500,2,1),rnorm(600,2,1),rnorm(400,2.2,1)),byrow=TRUE, ncol=10)
  colnames(X) <- letters[1:10]
  g <- c(rep(1,50),rep(2,60),rep(3,40))
  test <- gmw(X,g,test="kw",type="external")
  cs1 <- getSigTests(test)
  cs1

  simData <- runif(1000,0,1)
  simData <- c(simData,runif(200,0,0.01))
  simData2 <- runif(1000,0,1)
  simData2 <- c(simData2,runif(200,0,0.01))

  simDataMat <- rbind(simData,simData2)

  getSigTests(simDataMat, method="bon")
  getSigTests(simData, method="bon")
  getSigTests(simData2, method="bon")
  getSigTests(simData, method="sim")
  getSigTests(pvalues=simData, method="bh",alpha=0.05)
  getSigTests(pvalues=simData, method="csD")
  getSigTests(pvalues=simData, method="csR")

  set.seed(731)
  X <- matrix(c(rnorm(50,2,1),rnorm(60,2,1),rnorm(40,2.2,1)),byrow=TRUE, ncol=10)
  colnames(X) <- letters[1:10]
  g <- c(rep(1,5),rep(2,6),rep(3,4))
  X[12:15,1] <- X[12:15,1] + 5

  # Keep the permutation matrix in order to perform the W&Y adjustment
    testPM <- gmw(X,g,test="kw",type="perm",keepPM=TRUE)
  # Apply the Westfall& Young adjustment
    getSigTests(testPM,method="maxT")




