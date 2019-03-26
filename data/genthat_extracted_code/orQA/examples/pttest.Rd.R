library(orQA)


### Name: pttest
### Title: Perform permutation t-tests between consecutive levels of
###   ordered groups
### Aliases: pttest
### Keywords: regression

### ** Examples

data <- matrix(rnorm(7200),nc=72)
groups <- rep(1:4,each=18)
ind <- rep(rep(1:3,each=6),4)
out <- pttest(data,groups,B=1000,rep=ind)
guo(out$unadj,.05)
data2 <- data+matrix(rep(groups,nrow(data)),nr=nrow(data),byrow=TRUE)
out2 <- pttest(data2,groups,B=1000,rep=ind)
guo(out2$unadj,.05)



