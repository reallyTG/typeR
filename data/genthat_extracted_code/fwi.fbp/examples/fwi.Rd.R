library(fwi.fbp)


### Name: fwi
### Title: Fire Weather Index function, Deprecated
### Aliases: fwi

### ** Examples

library(fwi.fbp)
# The test data is a standard test
# dataset (Van Wagner and Pickett 1985). 

data("test_fwi")
head(test_fwi)
# Using the default initial values
fwi.out1<-fwi(test_fwi)   			

# Using a different set of initial values
fwi.out2<-fwi(test_fwi,init=c(80,10,16,50)) 

# fwi system components calculated based on previous day's 
# fwi outputs 
fwi.out3<-fwi(test_fwi,fwi.out1)                 

# Using a suite of initials, assuming variables from fwi.out1
# are the initial values for different records
init_suite<-fwi.out1[,c("ffmc","dmc","dc","lat")]
fwi.out4<-fwi(test_fwi,init=init_suite)

# Using only the required input variables:
fwi.out5<-fwi(test_fwi[,7:10])  

# Daylength adjustment:
# Change latitude values where the monthly daylength adjustments
# are different from the standard ones
test_fwi$lat<-22
# With daylength adjustment
fwi(test_fwi)[1:3,]
# Without daylength adjustment
fwi(test_fwi,lat.adjust=FALSE)[1:3,]




