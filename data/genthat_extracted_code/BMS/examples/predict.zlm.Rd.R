library(BMS)


### Name: predict.zlm
### Title: Predict Method for zlm Linear Model
### Aliases: predict.zlm
### Keywords: utilities

### ** Examples

 data(datafls)
 mm=zlm(datafls,g="EBL")
 
 predict(mm) #fitted values 
 predict(mm, newdata=1:41) #prediction based on a 'new data point' 
 
 #prediction based on a 'new data point', with 'standard errors'
 predict(mm, newdata=datafls[1,], se.fit=TRUE) 
 



