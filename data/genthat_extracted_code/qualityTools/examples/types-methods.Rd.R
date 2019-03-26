library(qualityTools)


### Name: types-methods
### Title: Get and set methods
### Aliases: types types<- types-methods types,facDesign-method
###   types<-,facDesign-method

### ** Examples

#NA in response column
fdo = fracDesign(k = 3)  
summary(fdo)
types(fdo) = c("numeric","numeric", "factor" )
names(fdo) = c("Time", "Temperature", "Catalyst")
summary(fdo)



