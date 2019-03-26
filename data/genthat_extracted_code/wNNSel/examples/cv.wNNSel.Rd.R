library(wNNSel)


### Name: cv.wNNSel
### Title: Cross Validation for wNNSel Imputation
### Aliases: cv.wNNSel
### Keywords: NA cross-validation wNNSel weights

### ** Examples

 set.seed(3)
 x.true = matrix(rnorm(100),10,10)
 ## create 10% missing values in x
 x.miss = artifNA(x.true, 0.10)
 ## use cross validation to find optimal values
 result = cv.wNNSel(x.miss)
 ## optimal values are
 result$lambda.opt
 result$m.opt
 ## Now use these values to get final imputation
 x.impute = wNNSel.impute(x.miss, lambda=result$lambda.opt, m=result$m.opt)
 ## and final MSIE
 computeMSIE(x.miss, x.impute, x.true)



