library(fpc)


### Name: confusion
### Title: Misclassification probabilities in mixtures
### Aliases: confusion
### Keywords: cluster multivariate

### ** Examples

  set.seed(12345)
  m <- rpois(20,lambda=5)
  dim(m) <- c(5,4)
  pro <- apply(m,2,sum)
  pro <- pro/sum(pro)
  m <- m/apply(m,1,sum)
  round(confusion(m,pro,1,2),digits=2)



