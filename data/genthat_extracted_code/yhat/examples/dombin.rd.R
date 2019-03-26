library(yhat)


### Name: dombin
### Title: Dominance Analysis
### Aliases: dombin
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

  ## Dominance analysis
     domOut=dominance(apsOut)

  ## Dominance analysis
     dombin(domOut)



