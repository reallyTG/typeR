library(BMS)


### Name: bms
### Title: Bayesian Model Sampling and Averaging
### Aliases: bms
### Keywords: models

### ** Examples

  data(datafls)
  #estimating a standard MC3 chain with 1000 burn-ins and 2000 iterations and uniform model priors
  bma1 = bms(datafls,burn=1000, iter=2000, mprior="uniform")

  ##standard coefficients based on exact likelihoods of the 100 best models:
  coef(bma1,exact=TRUE, std.coefs=TRUE) 
  
  #suppressing user-interactive output, using a customized starting value, and not saving the best 
  #  ...models for only 19 observations (but 41 covariates)
  bma2 = bms(datafls[20:39,],burn=1000, iter=2000, nmodel=0, start.value=c(1,4,7,30),
     user.int=FALSE)
  coef(bma2)
  
  #MC3 chain with a hyper-g prior (custom coefficient a=2.1), saving only the 20 best models, 
  # ...and an alternative sampling procedure; putting a log entry to console every 1000th step
  bma3 = bms(datafls,burn=1000, iter=5000, nmodel=20, g="hyper=2.1", mcmc="rev.jump",
      logfile="",logstep=1000)
  image(bma3) #showing the coefficient signs of the 20 best models
  
  #enumerating with 10 covariates (= 1024 models), keeping the shrinkage factors 
  #  ...of the best 200 models
  bma4 = bms(datafls[,1:11],mcmc="enumerate",nmodel=200,g.stats=TRUE)

  #another enumeration example: with less than 15 covariates, enumeration is the default
  #  ...of the best 200 models
  data(attitude)
  bma4b = bms(attitude)
  bma4c = bms(rating ~complaints + privileges + raises, data = attitude)


  #using an interaction sampler for two interaction terms
  dataint=datafls
  dataint=cbind(datafls,datafls$LifeExp*datafls$Abslat/1000,
        datafls$Protestants*datafls$Brit-datafls$Muslim)
  names(dataint)[ncol(dataint)-1]="LifeExp#Abslat"
  names(dataint)[ncol(dataint)]="Protestants#Brit#Muslim"
  bma5 = bms(X.data=dataint,burn=1000,iter=9000,start.value=0,mcmc="bd.int") 
  
  density(bma5,reg="English") # plot posterior density for covariate "English"
  
  # a matrix as X.data argument
  bms(matrix(rnorm(1000),100,10))
  
  # keeping a set of fixed regressors:
  bms(datafls, mprior.size=7, fixed.reg = c("PrScEnroll", "LifeExp", "GDP60"))
  # Note that mprior.size=7 means prior model size of 3 fixed to 4 'uncertain' regressors
  



