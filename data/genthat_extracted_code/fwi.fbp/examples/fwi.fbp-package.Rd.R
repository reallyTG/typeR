library(fwi.fbp)


### Name: fwi.fbp-package
### Title: Fire Weather Index and Fire Behavior Prediction Systems
### Aliases: fwi.fbp-package fwi.fbp

### ** Examples

library(fwi.fbp)

######## fwi function examples ########
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



######## fwiBAT function examples ########
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



######## fbp function examples ########
# The dataset is the standard test data
# provided by Wotton et al (2009).

data("test_fbp")
head(test_fbp)
#Primary output (default)
fbp(test_fbp)
#or
fbp(test_fbp,output="Primary") 
#or 
fbp(test_fbp,"P")

#Secondary output          
fbp(test_fbp,"Secondary")
#or
fbp(test_fbp,"S")

#All output          
fbp(test_fbp,"All")
#or
fbp(test_fbp,"A")

#For a single record:
fbp(test_fbp[7,])    
#For a section of the records:
fbp(test_fbp[8:13,])	

#fbp function produces the default values if no data is fed to
#the function:
fbp()



