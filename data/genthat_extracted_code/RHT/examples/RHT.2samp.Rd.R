library(RHT)


### Name: RHT.2samp
### Title: Two-sample Regularized Hotelling's T-square Test
### Aliases: RHT.2samp
### Keywords: RHT

### ** Examples

  ## We simulate a data set X with N=10 samples and p=50 proteins,
  ## and a second data set Y with N=8 sample and the same number of proteins. 
  ## 20% of the data are missing.
  
  
  set.seed(1)
  X <- matrix(rnorm(500),nrow=10)
  X[sample(1:500, 0.2*500)] <- NA
  
  Y <- matrix(rnorm(400),nrow=8)
  Y[sample(1:400, 0.2*400)] <- NA
  
  ## Among the 50 proteins, we randomly assign 2 pathways, with 5 and 12 proteins, respectively.
  path.idx <- list()
  path.idx[[1]] <- 1:5
  path.idx[[2]] <- 13:24
  names(path.idx) <- c("pathway A", "pathway B")
  
  ## The following function tests each pathway to see
  ## if any of the proteins in each pathway shows different 
  ## abundance/expression between data X and Y.
  
  pval <- RHT.2samp(path.idx, datX=X, datY=Y)




