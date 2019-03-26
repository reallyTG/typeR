library(phytotools)


### Name: reflectance
### Title: Computes surface reflectance
### Aliases: reflectance

### ** Examples


#Calculate surface reflectance in 10 minute increments 
#for Godthabsfjord fjord, Greenland on March 1

#Setup date sequence
date <- seq(ISOdatetime(2013,3,1,0,0,0,tz="UTC"), 
            ISOdatetime(2013,3,2,0,0,0,tz="UTC"),
            by = "10 min")

#Call the function
ref <- reflectance(date,64.20,-51.76,-3)

#Plot data
plot(ref[,1],ref[,2],type="l",xlab="Day of Year",ylab="Surface Reflectance")




