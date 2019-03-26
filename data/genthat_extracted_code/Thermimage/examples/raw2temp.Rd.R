library(Thermimage)


### Name: raw2temp
### Title: Converts raw thermal data into temperature (oC)
### Aliases: raw2temp

### ** Examples

# General Usage:
# raw2temp(raw,E,OD,RTemp,ATemp,IRWTemp,IRT,RH,PR1,PB,PF,PO,PR2)

#
# Example with all settings at default/blackbody levels:
raw2temp(18109,1,0,20,20,20,1,50,PR1=21106.77,PB=1501,PF=1,PO=-7340,PR2=0.012545258)

# Example with emissivity=0.95, distance=1m, window transmission=0.96, all temperatures=20C, 
# 50 RH:

raw2temp(18109,0.95,1,20,20,20,0.96,50) 
# Note: default calibration constants for the FLIR camera will be used if you leave out the
# calibration data

# Vector example
r<-17000:25000
t1.0<-raw2temp(r,1,0,20,20,20,0.96,50)
t0.9<-raw2temp(r,0.9,0,20,20,20,0.96,50)

dev.off()
plot(r,t1.0,type="l",col="red")
lines(r,t0.9,col="black")
legend("topleft", bty = "n", c("E=1.0", "E=0.9"), lty=c(1,1), col=c("red", "black"))

# Create a templookup vector - faster calculations when working with huge binary data files
# suppressWarnings remove the NaN warning that results from the low values falling outside the 
# range of temperatures relevant

suppressWarnings(templookup<-raw2temp(raw=1:65535)) 
r<-floor(runif(10000000, 16000,25000)) # create a long vector of raw binary values

# calculate temperature using the lookup vector:
system.time(templookup[r]) # 0.109 seconds

# calculate temperature using the raw2temp function on the raw vector: 
system.time(raw2temp(r)) # 0.248 seconds

# For information on the effectiveness of the raw2temp and temp2raw
# functions at estimating temperature properly, see the following:
# https://github.com/gtatters/ThermimageCalibration



