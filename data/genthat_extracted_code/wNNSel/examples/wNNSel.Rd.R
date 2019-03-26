library(wNNSel)


### Name: wNNSel
### Title: Imputatin using wNNSel method.
### Aliases: wNNSel
### Keywords: NA cross-validation wNNSel

### ** Examples

 set.seed(3)
 x.true = matrix(rnorm(100),10,10)
 ## create 10% missing values in x
 x.miss = artifNA(x.true, 0.10)
 ## imputed matrix
 result <- wNNSel(x.miss)
 result$x.impute
 ## cross validation result can be accessed using
 result$cross.val



