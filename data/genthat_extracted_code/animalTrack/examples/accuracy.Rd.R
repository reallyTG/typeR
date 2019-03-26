library(animalTrack)


### Name: accuracy
### Title: Estimate accuracy of three axis accelerometer/magnetometer.
### Aliases: accuracy accuracy.improve

### ** Examples


## Load seal dive data. see help(hugh) for details on variables.
## There are six dives, with surface intervals. here, we will
## look at the first 3 dives.
data(hugh)
## accuracy of the accelerometer.
A.acc.1 <- accuracy(hugh$Ax.dec[hugh$diven == 1],hugh$Ay.dec[hugh$diven == 1],
                    hugh$Az.dec[hugh$diven == 1])
A.acc.2 <- accuracy(hugh$Ax.dec[hugh$diven == 2],hugh$Ay.dec[hugh$diven == 2],
                    hugh$Az.dec[hugh$diven == 2])
A.acc.3 <- accuracy(hugh$Ax.dec[hugh$diven == 3],hugh$Ay.dec[hugh$diven == 3],
                    hugh$Az.dec[hugh$diven == 3])
## Plot the accuracy during the track.
## dive 1 has a high error due to some outliers. dive 2 looks much better.
## dive 3 has some outliers similar to dive 1.
plot(A.acc.1$acc)
plot(A.acc.2$acc)
plot(A.acc.3$acc)
## error angle in degrees
asin(A.acc.1$std)*(180/pi)
asin(A.acc.2$std)*(180/pi)
asin(A.acc.3$std)*(180/pi)

## See if there is a systematic error in the Z-axis. Warnings will occur
## if there are errors in the X, Y, or Z-axis (i.e. too large/small
## of a value). 
acc.d1 <- accuracy.improve(hugh$Ax.dec[hugh$diven == 1],hugh$Ay.dec[hugh$diven == 1],
                           hugh$Az.dec[hugh$diven == 1])
acc.d2 <- accuracy.improve(hugh$Ax.dec[hugh$diven == 2],hugh$Ay.dec[hugh$diven == 2],
                           hugh$Az.dec[hugh$diven == 2])
acc.d3 <- accuracy.improve(hugh$Ax.dec[hugh$diven == 3],hugh$Ay.dec[hugh$diven == 3],
                           hugh$Az.dec[hugh$diven == 3])
## Plot the Z-axis values, the estimates, and the residuals
## We can see that there are large spikes. These spikes may
## coincide with movement. The Z values during these spikes
## could be filtered out, or a new filter to the Z accelerometer
## may be needed. This will vary according to the sensor,
## type of animal, etc.
plot(hugh$Az.dec[hugh$diven == 1],ylim=c(-.5,1.5))
points(acc.d1$z.est,col='red')
lines(acc.d1$z.resid,col='blue')
legend(400,-.05,legend=c("Z-axis","Z-axis estimates","Residuals"),
       lty=c(0,0,1),pch=c(1,1,NA),col=c("black","red","blue"),bty="n")
plot(hugh$Az.dec[hugh$diven == 2],ylim=c(-.5,1.5))
points(acc.d2$z.est,col='red')
lines(acc.d2$z.resid,col='blue')
legend(300,-.05,legend=c("Z-axis","Z-axis estimates","Residuals"),
       lty=c(0,0,1),pch=c(1,1,NA),col=c("black","red","blue"),bty="n")
plot(hugh$Az.dec[hugh$diven == 3],ylim=c(-.5,1.5))
points(acc.d3$z.est,col='red')
lines(acc.d3$z.resid,col='blue')
legend(400,-.05,legend=c("Z-axis","Z-axis estimates","Residuals"),
       lty=c(0,0,1),pch=c(1,1,NA),col=c("black","red","blue"),bty="n")





