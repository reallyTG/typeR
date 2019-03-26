library(adlift)


### Name: adjustx
### Title: adjustx
### Aliases: adjustx
### Keywords: manip arith

### ** Examples

#read in the motorcycle crash data 
#
data(motorcycledata)

#
dim(motorcycledata)

#check data.
#
times<-motorcycledata$time
accel<-motorcycledata$accel

a<-adjustx(times,accel,"mean")
#
#note the repeated values in the original grid data
#
#display new data vectors
a$sepx
#
a$sepf
# 
#and now the new adjusted data has length 94.
#



