library(orQA)


### Name: e2test
### Title: Perform permutation Barlow's test on a dataset
### Aliases: e2test
### Keywords: regression

### ** Examples

data <- matrix(rnorm(7200),nc=72)
groups <- rep(1:4,each=18)
ind <- rep(rep(1:3,each=6),4)
out <- e2test(data,groups,B=1000,rep=ind)
sum(out$adj<.05)
data2 <- data+matrix(rep(groups,nrow(data)),nr=nrow(data),byrow=TRUE)
out2 <- e2test(data2,groups,B=1000,rep=ind)
sum(out2$adj<.05)



