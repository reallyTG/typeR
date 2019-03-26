library(yhat)


### Name: commonality
### Title: Commonality Analysis
### Aliases: commonality
### Keywords: models regression

### ** Examples

  ## Predict paragraph comprehension based on three verbal
  ## tests: general info, sentence comprehension, & word
  ## classification

  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)

  ## All-possible-subsets regression
     apsOut=aps(HS.data,"paragrap",list("general", "sentence","wordc"))

  ## Commonality analysis
     commonality(apsOut)



