library(accelmissing)


### Name: wear.time.plot
### Title: Proportion of Wearing over Time
### Aliases: wear.time.plot
### Keywords: accelerometer accelmissing

### ** Examples

data(acceldata) # read data
ls(acceldata)     # list with four data matrix objects, PA, label, flag, and demo
attach(acceldata)

# plot the proportion of wearing over time
wear.time.plot(PA, label, flag)	



