library(FAdist)


### Name: GAMMA3
### Title: Three-Parameter Gamma Distribution (also known as Pearson type
###   III distribution)
### Aliases: dgamma3 pgamma3 qgamma3 rgamma3
### Keywords: distribution

### ** Examples

thres <- 10
x <- rgamma3(n=10,shape=2,scale=11,thres=thres)
dgamma3(x,2,11,thres)
dgamma(x-thres,2,1/11)



