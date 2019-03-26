library(BMS)


### Name: predict.bma
### Title: Predict Method for bma Objects
### Aliases: predict.bma
### Keywords: utilities

### ** Examples

 data(datafls)
 mm=bms(datafls,user.int=FALSE)
 
 predict(mm) #fitted values based on MCM frequencies
 predict(mm, exact=TRUE) #fitted values based on best models
 
 predict(mm, newdata=1:41) #prediction based on MCMC frequencies 
 
 predict(mm, newdata=datafls[1,], exact=TRUE) #prediction based on a data.frame
 
 # the following two are equivalent:
 predict(mm, topmodels=1:10)
 predict(mm[1:10], exact=TRUE)
 
 



