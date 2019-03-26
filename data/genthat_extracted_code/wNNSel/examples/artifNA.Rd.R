library(wNNSel)


### Name: artifNA
### Title: Introduce MCAR Missing Values in a matrix
### Aliases: artifNA
### Keywords: NA

### ** Examples

 set.seed(3)
 x = matrix(rnorm(100),10,10)
 ## create 10% missing values in x
 artifNA(x, 0.10)



