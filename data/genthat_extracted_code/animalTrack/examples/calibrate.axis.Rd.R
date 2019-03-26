library(animalTrack)


### Name: calibrate.axis
### Title: Scale and center an accelerometer/magnetometer axis.
### Aliases: calibrate.axis

### ** Examples


## Import the missionbay_calib2 dataset. There is a calibration sequence 
## at Mission Bay, CA. Use help(missionbay_calib2) for info.

data(missionbay_calib2)
mx <- missionbay_calib2$mx_raw
my <- missionbay_calib2$my_raw
mz <- missionbay_calib2$mz_raw

ax <- missionbay_calib2$ax_raw
ay <- missionbay_calib2$ay_raw
az <- missionbay_calib2$az_raw
## Scale and center the magnetometer axes. Also, make sure that each axis 
## is in the NED (north-east-down) orientation (this is the reason for the
## negative signs).

Mxscaled <- calibrate.axis(mx, max(mx), min(mx))
Myscaled <- -calibrate.axis(my, max(my), min(my))
Mzscaled <- -calibrate.axis(mz, max(mz), min(mz))

## Scale and center the accelerometer axes. Also, make sure that each axis 
## is in the NED (north-east-down) orientation.

Axscaled <- -calibrate.axis(ax, max(ax), min(ax))
Ayscaled <- calibrate.axis(ay, max(ay), min(ay))
Azscaled <- calibrate.axis(az, max(az), min(az))

## Compare
par(mfrow=c(2,3))
plot(mx,type="l",col="blue",xlab="time (s)",ylab="bits",main="Mx Raw",lwd=3)
plot(my,type="l",col="blue",xlab="time (s)",ylab="bits",main="My Raw",lwd=3)
plot(mz,type="l",col="blue",xlab="time (s)",ylab="bits",main="Mz Raw",lwd=3)
plot(Mxscaled,type="l",col="red",xlab="time (s)",ylab="bits",main="Mx Calibrated",lwd=3) 
plot(Myscaled,type="l",col="red",xlab="time (s)",ylab="bits",main="My Calibrated",lwd=3) 
plot(Mzscaled,type="l",col="red",xlab="time (s)",ylab="bits",main="Mz Calibrated",lwd=3) 




