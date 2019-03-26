library(yhat)


### Name: aps
### Title: All Possible Subsets Regression
### Aliases: aps
### Keywords: models regression

### ** Examples

  ## APS regression predicting miles per gallon based 
  ## on vehicle weight, type of 
  ## carborator, & number of engine cylinders
     apsOut<-aps(mtcars,"mpg",list("wt","carb","cyl"))

  ## APS regression predicting paragraph comprehension based 
  ## on thre verbal tests: general info, sentence comprehension,
  ## & word classification
 
  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)
  ## APS
     apsOut<-aps(HS.data,"paragrap",list("general","sentence",
                                         "wordc"))



