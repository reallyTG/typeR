library(mgcv)


### Name: gam.vcomp
### Title: Report gam smoothness estimates as variance components
### Aliases: gam.vcomp
### Keywords: models smooth regression

### ** Examples
 
  set.seed(3) 
  require(mgcv)
  ## simulate some data, consisting of a smooth truth + random effects

  dat <- gamSim(1,n=400,dist="normal",scale=2)
  a <- factor(sample(1:10,400,replace=TRUE))
  b <- factor(sample(1:7,400,replace=TRUE))
  Xa <- model.matrix(~a-1)    ## random main effects
  Xb <-  model.matrix(~b-1)
  Xab <- model.matrix(~a:b-1) ## random interaction
  dat$y <- dat$y + Xa%*%rnorm(10)*.5 + 
           Xb%*%rnorm(7)*.3 + Xab%*%rnorm(70)*.7
  dat$a <- a;dat$b <- b

  ## Fit the model using "re" terms, and smoother linkage  
  
  mod <- gam(y~s(a,bs="re")+s(b,bs="re")+s(a,b,bs="re")+s(x0,id=1)+s(x1,id=1)+
               s(x2,k=15)+s(x3),data=dat,method="ML")

  gam.vcomp(mod) 




