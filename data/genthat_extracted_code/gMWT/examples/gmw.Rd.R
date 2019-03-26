library(gMWT)


### Name: gmw
### Title: Generalized Mann-Whitney Type Tests
### Aliases: gmw
### Keywords: methods

### ** Examples

  X <- c(sample(15))
  X <- c(X,101,102,103)
  g <- c(1,1,1,2,2,2,2,3,3,3,4,4,4,4,4,5,5,5)
  cluster=c(rep(c(1,2),9))

  gmw(X,g,test="kw",type="external")
  gmw(X,g,test="kw",type="permutation")
  gmw(X,g,test="kw",type="permutation",cluster=cluster)

  gmw(X,g,test="jt",type="permutation")




