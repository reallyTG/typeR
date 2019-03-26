library(yhat)


### Name: calc.yhat
### Title: More regression indices for lm class objects
### Aliases: calc.yhat

### ** Examples

  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification
  
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)
  
  ## Regression
     lm.out<-lm(paragrap~general+sentence+wordc,data=HS.data)
  
  ## Regression Indices
     regr.out<-calc.yhat(lm.out)



