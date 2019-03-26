library(yhat)


### Name: booteval.yhat
### Title: Evaluate bootstrap metrics produced from /codecalc.yhat
### Aliases: booteval.yhat
### Keywords: models regression

### ** Examples

  ## Bootstrap regression results predicting paragraph     
  ## comprehension based on four verbal tests: general info, 
  ## sentence comprehension, & word classification
 
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)

  ## Regression
     lm.out<-lm(paragrap~general+sentence+wordc,data=HS.data)

  ## Calculate regression metrics
     regrOut<-calc.yhat(lm.out)

  ## Bootstrap results
     require ("boot")
     boot.out<-boot(HS.data,boot.yhat,100,lmOut=lm.out,regrout0=regrOut)

  ## Evaluate bootstrap results
     result<-booteval.yhat(regrOut,boot.out,bty="perc")



