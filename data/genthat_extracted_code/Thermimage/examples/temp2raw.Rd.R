library(Thermimage)


### Name: temp2raw
### Title: Converts temperature (oC) to raw thermal data
### Aliases: temp2raw

### ** Examples

# General Usage:
# temp2raw(temp,E,OD,RTemp,ATemp,IRWTemp,IRT,RH,PR1,PB,PF,PO,PR2)

# Example with all settings at default/blackbody levels:
temp2raw(23,1,0,20,20,20,1,50,PR1=21106.77,PB=1501,PF=1,PO=-7340,PR2=0.012545258)

# Example with emissivity=0.95, distance=1m, window transmission=0.96, all temperatures=20C,
# 50 RH:

temp2raw(23,0.95,1,20,20,20,0.96,50) 
# Note: default calibration constants for my FLIR camera will be used if you leave out the
# calibration data

t<-10:50
r1.0<-temp2raw(t,1,0,20,20,20,0.96,50)
r0.9<-temp2raw(t,0.9,0,20,20,20,0.96,50)

dev.off()
plot(t,r1.0,type="l",col="red")
lines(t,r0.9,col="black")
legend("topleft", bty = "n", c("E=1.0", "E=0.9"), lty=c(1,1), col=c("red", "black"))

# For information on the effectiveness of the raw2temp and temp2raw 
# functions at estimating temperature properly, see the following:
# https://github.com/gtatters/ThermimageCalibration




