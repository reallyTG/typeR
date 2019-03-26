library(wNNSel)


### Name: computeNRMSE
### Title: Normalized Root Mean Squared Imputatoin Error
### Aliases: computeNRMSE
### Keywords: error

### ** Examples

  set.seed(3)
  x.true = matrix(rnorm(100),10,10)
  ## create 10% missing values in x
  x.miss = artifNA(x.true, 0.10)
  ## impute using wNNSel method
  x.impute = wNNSel.impute(x.miss)
  computeNRMSE(x.miss, x.impute, x.true)



