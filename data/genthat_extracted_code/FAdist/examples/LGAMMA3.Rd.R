library(FAdist)


### Name: LGAMMA3
### Title: Log-Pearson Type III Distribution
### Aliases: dlgamma3 plgamma3 qlgamma3 rlgamma3
### Keywords: distribution

### ** Examples

thres <- 10
x <- rlgamma3(n=10,shape=2,scale=11,thres=thres)
dlgamma3(x,2,11,thres)
dgamma3(log(x),2,1/11,thres)/x
dgamma(log(x)-thres,2,11)/x



