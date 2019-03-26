library(EMCluster)


### Name: Assign Class
### Title: Assign Class Id
### Aliases: assign.class
### Keywords: tool

### ** Examples

library(EMCluster, quietly = TRUE)
set.seed(1234)
x2 <- da2$da

ret <- init.EM(x2, nclass = 2)
ret.new <- assign.class(x2, ret, return.all = FALSE)
str(ret.new)



