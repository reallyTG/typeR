library(regress)


### Name: regress
### Title: Fit a Gaussian Linear Model with Linear Covariance Structure
### Aliases: regress print.regress summary.regress BLUP
### Keywords: regression models multivariate

### ** Examples


  ######################
  ## Comparison with lme
  ######################

  ## Example of Random Effects model from Venables and Ripley, page 205
  library(nlme)
  library(regress)

  citation("regress")

  names(Oats) <- c("B","V","N","Y")
  Oats$N <- as.factor(Oats$N)

  ## Using regress
  oats.reg <- regress(Y~N+V,~B+I(B:V),identity=TRUE,verbose=1,data=Oats)
  summary(oats.reg)

  ## Using lme
  oats.lme <- lme(Y~N+V,random=~1|B/V,data=Oats,method="REML")
  summary(oats.lme)

  ## print and summary
  oats.reg
  print(oats.reg)
  summary(oats.reg)

  ranef(oats.lme)
  BLUP(oats.reg)

  rm(oats.reg, oats.lme, Oats)

  #######################
  ## Computation of BLUPs
  #######################

  ex2 <- list()
  ex2 <- within(ex2,{

    ## Set up example
    set.seed(1001)
    n <- 101
    x1 <- runif(n)
    x2 <- seq(0,1,l=n)
    z1 <- gl(4,10,n)
    z2 <- gl(6,1,n)

    X <- model.matrix(~1 + x1 + x2)
    Z1 <- model.matrix(~z1-1)
    Z2 <- model.matrix(~z2-1)

    ## Create the individual random and fixed effects
    beta <- c(1,2,3)
    eta1 <- rnorm(ncol(Z1),0,10)
    eta2 <- rnorm(ncol(Z2),0,10)
    eps <- rnorm(n,0,3)

    ## Combine them into a response
    y <- X %*% beta + Z1 %*% eta1 + Z2 %*% eta2 + eps
  })

  ## Data frame containing all we need for model fitting
  regressDF <- with(ex2,data.frame(y,x1,x2,z1,z2))
  rm(ex2)

  ## Fit the model using regress
  regress.output <- regress(y~1 + x1 + x2,~z1 + z2,data=regressDF)

  summary(regress.output)

  blup1 <- BLUP(regress.output,RE="z1")
  blup1$Mean
  blup1$Variance
  blup1$Covariance
  cov2cor(blup1$Covariance) ## Large correlation terms

  blup2 <- BLUP(regress.output) ## Joint BLUP of z1 and z2 by default
  blup2$Mean
  blup2$Variance
  cov2cor(blup2$Covariance)  ## Strong negative correlation between BLUPs
                             ## for z1 and z2

  rm(blup1,blup2)

  ############################
  ## Examples of use of kernel
  ############################

  ## REML LRT for x2 which will be 0 as x2 lies in the kernel
  with(regressDF,{
       K <- model.matrix(~1+x1+x2)
       model1 <- regress(y~1+x1,~z1,kernel=K)
       model2 <- regress(y~1+x1+x2,~z1,kernel=K)
       2*(model2$llik - model1$llik)
  })

  ## LRT for x2 using ordinary likelihood
  with(regressDF,{
       K <- 0
       model1 <- regress(y~1+x1,~z1,kernel=K)
       model2 <- regress(y~1+x1+x2,~z1,kernel=K)
       2*(model2$llik - model1$llik)
  })

  ## LRT for x2 based on a reduced observation TY with kernel K. This
  ## LRT is approximately equal to the last one, and numerically this
  ## turns out to be the case also.
  with(regressDF,{
       K <- model.matrix(~1+x1)
       model1 <- regress(y~1+x1,~z1,kernel=K)
       model2 <- regress(y~1+x1+x2,~z1,kernel=K)
       2*(model2$llik - model1$llik)
  })

  ## Two ways to drop out the 17th and 19th observations.
  with(regressDF,{
       n <- length(y)
       K <- matrix(0,n,2)
       K[17,1] <- K[19,2] <- 1
       model1 <- regress(y~1+x1,~z1,kernel=K,tol=1e-8)
       drop <- c(17,19)
       model2 <- regress(y[-drop]~1+x1[-drop],~z1[-drop],kernel=0,tol=1e-8)
       print(model1)
       print(model2)
  })

  rm(regressDF, regress.output)



