library(bbmle)


### Name: ICtab
### Title: Compute table of information criteria and auxiliary info
### Aliases: ICtab AICtab BICtab AICctab print.ICtab
### Keywords: misc

### ** Examples

  set.seed(101)
  d <- data.frame(x=1:20,y=rpois(20,lambda=2))
  m0 <- glm(y~1,data=d)
  m1 <- update(m0,.~x)
  m2 <- update(m0,.~poly(x,2))
  AICtab(m0,m1,m2,mnames=LETTERS[1:3])
  AICtab(m0,m1,m2,base=TRUE,logLik=TRUE)
  AICtab(m0,m1,m2,logLik=TRUE)
  AICctab(m0,m1,m2,weights=TRUE)
  print(AICctab(m0,m1,m2,weights=TRUE),min.weight=0.1)



