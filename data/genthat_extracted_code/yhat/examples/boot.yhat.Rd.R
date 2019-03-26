library(yhat)


### Name: boot.yhat
### Title: Bootstrap metrics produced from /codecalc.yhat
### Aliases: boot.yhat
### Keywords: models regression

### ** Examples

  ## Bootstrap regression results predicting paragraph     
  ## comprehension based on three verbal tests: general info, 
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



