library(mgcv)


### Name: get.var
### Title: Get named variable or evaluate expression from list or
###   data.frame
### Aliases: get.var
### Keywords: models smooth regression

### ** Examples

require(mgcv)
y <- 1:4;dat<-data.frame(x=5:10)
get.var("x",dat)
get.var("y",dat)
get.var("x==6",dat)
dat <- list(X=matrix(1:6,3,2))
get.var("X",dat)



