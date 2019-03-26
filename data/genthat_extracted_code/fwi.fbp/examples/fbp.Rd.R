library(fwi.fbp)


### Name: fbp
### Title: Fire Behavior Prediction System function, Deprecated
### Aliases: fbp

### ** Examples

library(fwi.fbp)
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





