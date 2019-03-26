library(yhat)


### Name: plotCI.yhat
### Title: Plot CIs from yhat
### Aliases: plotCI.yhat
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

  ## Evaluate bootstrap results
     result<-booteval.yhat(regrOut,boot.out,bty="perc")

  ## Plot results
  ## plotCI.yhat(regrOut$PredictorMetrics[-nrow(regrOut$PredictorMetrics),],
  ## result$upperCIpm,result$lowerCIpm, pid=which(colnames(regrOut$PredictorMetrics) 
  ## %in% c("Beta","rs","CD:0","CD:1","CD:2","GenDom","Pratt","RLW") == TRUE),nr=3,nc=3)



