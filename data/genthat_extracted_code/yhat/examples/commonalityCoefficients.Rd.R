library(yhat)


### Name: commonalityCoefficients
### Title: Commonality Coefficents
### Aliases: commonalityCoefficients
### Keywords: models regression

### ** Examples

  ## Predict miles per gallon based on vehicle weight, type of 
  ## carborator, & number of engine cylinders
     commonalityCoefficients(mtcars,"mpg",list("wt","carb","cyl"))

  ## Predict paragraph comprehension based on four verbal
  ## tests: general info, sentence comprehension, word
  ## classification, & word type 
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)
  ## Commonality Coefficient Analysis
     commonalityCoefficients(HS.data,"paragrap",list("general",
       "sentence","wordc","wordm"))




