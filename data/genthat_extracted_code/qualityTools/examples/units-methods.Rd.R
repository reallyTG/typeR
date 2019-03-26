library(qualityTools)


### Name: units-methods
### Title: Get and set methods
### Aliases: units units<- units-methods units,facDesign-method
###   units<-,facDesign-method units,mixDesign-method
###   units<-,mixDesign-method units,taguchiDesign-method
###   units<-,taguchiDesign-method units,pbDesign-method
###   units<-,pbDesign-method

### ** Examples

#NA in response column
fdo = fracDesign(k = 2)  
summary(fdo)
units(fdo) = c("min","C") 
names(fdo) = c("Time", "Temperature") 
summary(fdo)



