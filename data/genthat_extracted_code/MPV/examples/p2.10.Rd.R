library(MPV)


### Name: p2.10
### Title: Data Set for Problem 2-10
### Aliases: p2.10
### Keywords: datasets

### ** Examples

data(p2.10)
attach(p2.10)
cor.test(weight, sysbp, method="pearson")  # tests rho=0
                                           # and computes 95% CI for rho
                                           # using Fisher's Z-transform



