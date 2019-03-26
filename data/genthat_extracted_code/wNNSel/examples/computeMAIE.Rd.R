library(wNNSel)


### Name: computeMAIE
### Title: Mean Absolute Imputation Error
### Aliases: computeMAIE
### Keywords: error

### ** Examples

  set.seed(3)
  x.true = matrix(rnorm(100),10,10)
  ## create 10% missing values in x
  x.miss = artifNA(x.true, 0.10)
  ## impute using wNNSel method
  x.impute = wNNSel.impute(x.miss)
  computeMAIE(x.miss, x.impute, x.true)



