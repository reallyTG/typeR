library(fwi.fbp)


### Name: fwiBAT
### Title: Fire Weather Index batch function, Deprecated
### Aliases: fwiBAT

### ** Examples

library(fwi.fbp)
# The test data is a standard test
# dataset for FWI system(Van Wagner and Pickett 1985). 

data("test_fwi")
head(test_fwi)

# using the default initial values
fwi.out<-fwiBAT(test_fwi)   			

# using a different set of initials 
fwi.out<-fwiBAT(test_fwi,init=c(80,10,16,50)) 

# using only the required input variables:
fwi.out<-fwiBAT(test_fwi[,7:10])




