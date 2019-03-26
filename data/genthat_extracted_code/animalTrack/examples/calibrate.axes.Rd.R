library(animalTrack)


### Name: calibrate.axes
### Title: Calibrate two accelerometer/magnetometer axes. Axes are scaled
###   and centered.
### Aliases: calibrate.axes

### ** Examples


## Import the missionbay_calib2 dataset. There is a calibration sequence 
## at Mission Bay, CA. Use help(missionbay_calib2) for info.

data(missionbay_calib2)

# Uncalibrated raw values
mx <- missionbay_calib2$mx_raw
my <- missionbay_calib2$my_raw

plot(mx,col='blue',type='l',lwd=3)
lines(my,col='green',lwd=3)

## Scale and center the x and y magnetometer axes against one another. Also, make 
## sure that each axis is in the NED (north-east-down) orientation.
cal <- calibrate.axes(mx, my)
attributes(cal)

plot(cal$xhscaled,col='blue',type='l',lwd=3)
lines(cal$yhscaled,col='green',lwd=3)




