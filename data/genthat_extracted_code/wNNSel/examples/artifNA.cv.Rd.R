library(wNNSel)


### Name: artifNA.cv
### Title: Introduce MCAR Missing Values in a matrix for cross validation
### Aliases: artifNA.cv
### Keywords: NA cross-validation

### ** Examples

 set.seed(3)
 x = matrix(rnorm(100),10,10)
 ## create 10% missing values in x
 x.miss<- artifNA(x, 0.10)
 ## create another 10% missing values in x
 x.miss.cv<- artifNA.cv(x, 0.10)
 summary(x.miss)
 summary(x.miss.cv)



