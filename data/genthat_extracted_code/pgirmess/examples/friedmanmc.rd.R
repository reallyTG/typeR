library(pgirmess)


### Name: friedmanmc
### Title: Multiple comparisons after Friedman test
### Aliases: friedmanmc
### Keywords: htest

### ** Examples

  data(siegelp179)
  attach(siegelp179)
  
  friedman.test(score,treatment,block)
  friedmanmc(score,treatment,block)
  friedmanmc(score,treatment,block,probs=0.01)
  
  mymatrix<-matrix(score,nc=3)
  friedman.test(mymatrix)
  friedmanmc(mymatrix)
  detach(siegelp179)
  



