library(RHT)


### Name: RHT.fun
### Title: One-sample Regularized Hotelling's T-square Test
### Aliases: RHT.fun
### Keywords: RHT

### ** Examples

  ## we simulate a data set with N=10 samples and p=50 proteins. 
  ## 20% of the data are missing.
  ## Among the 50 proteins, we randomly assign 2 pathways, with 5 and 12 proteins, respectively.
  
  set.seed(1)
  X <- matrix(rnorm(500),nrow=10)
  X[sample(1:500, 0.2*500)] <- NA
  path.idx <- list()
  path.idx[[1]] <- 1:5
  path.idx[[2]] <- 13:24
  names(path.idx) <- c("pathway A", "pathway B")
  
  ## The following function tests each pathway to see
  ## if any of the proteins in each pathway shows non-zero 
  ## abundance/expression
  
  pval <- RHT.fun(path.idx, dat=X)




