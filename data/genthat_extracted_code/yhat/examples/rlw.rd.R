library(yhat)


### Name: rlw
### Title: Relative Weights
### Aliases: rlw
### Keywords: models regression

### ** Examples

  ## Relative weights from regression model predicting paragraph 
  ## comprehension based on three verbal tests: general info, 
  ## sentence comprehension, & word classification
 
  ## Use HS dataset in MBESS 
     require("MBESS")
     data(HS.data)

  ## Relative Weights
     rwlOut<-rlw(HS.data,"paragrap",c("general","sentence","wordc"))




