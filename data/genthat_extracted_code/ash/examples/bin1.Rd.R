library(ash)


### Name: bin1
### Title: univariate binning
### Aliases: bin1
### Keywords: nonparametric

### ** Examples

x <- rnorm(100)         # data vector
ab <- c(-5,5)           # bin interval
bins <- bin1(x,ab,10)     # bin x into 10 bins over ab



