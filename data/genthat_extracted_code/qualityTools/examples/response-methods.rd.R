library(qualityTools)


### Name: response-methods
### Title: Get and set methods
### Aliases: response response<- response,facDesign-method
###   response<-,facDesign-method response,mixDesign-method
###   response<-,mixDesign-method response,taguchiDesign-method
###   response<-,taguchiDesign-method response,pbDesign-method
###   response<-,pbDesign-method response,steepAscent-method
###   response<-,steepAscent-method response,gageRR-method
###   response<-,gageRR-method response,MSALinearity-method
###   response<-,MSALinearity-method

### ** Examples

#NA in response column
fdo = fracDesign(k = 3)   
fdo

#response
y = rnorm(8) 
  
#2^k numeric values in response column           
response(fdo) = y        
fdo



