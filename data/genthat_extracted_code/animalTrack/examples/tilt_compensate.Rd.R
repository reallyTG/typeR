library(animalTrack)


### Name: tilt_compensate
### Title: Tilt compensated compass.
### Aliases: tilt_compensate

### ** Examples


## Import the yprsim dataset. This is a series of 2 yaws, 2 pitches, 
## and 2 rolls. It is a simulated calibration Sequence. For details see 
## help(yprsim)

data(yprsim)

## assign variables

mx <- yprsim$mx
my <- yprsim$my
mz <- yprsim$mz

ax <- yprsim$ax
ay <- yprsim$ay
az <- yprsim$az

## The magnetometer and accelerometer data are already scaled and centered in the 
## NED frame. Also, there is no magnetic inclination simulated in this dataset. 
## So, this calibration simulation would be valid at the magnetic equator.

pitch <- pitch(ax, ay, az)
roll <- roll(ay, az)

## calculate tilt compensated heading. with no declination.

tilt <- tilt_compensate(mx, my, mz, pitch, roll, 
                        declination = 0, angle = "radian")

## Check the list of variables that is produced.
attributes(tilt)

## Plot
plot(tilt$heading_mag*(180/pi),col='red',type="l",lwd=2,ylim=c(-180,360),
     xlab="time (s)", ylab="degrees",main="Simulated Heading,
       Yaw, Pitch, and Roll")
lines(pitch*(180/pi),col='black',type='l',lty=1,lwd=2)
lines(roll*(180/pi),col='blue',lty=2,lwd=2)
abline(v=c(126,252),lty=3,lwd=2)
legend(0,-50,legend=c("Heading","Pitch","Roll"),col=c("red","black","blue"),
       lty=c(1,1,2),bty="n")

## Create a series of 3d plots, that can be saved to a 
## file directory. These can then be used for animation.
## Not run: 
##D   
##D   ## make sure that the "rgl" library is installed
##D   
##D   filename <- "~Rdir/"
##D   # Make an animated 3d plot of all the rotations
##D   
##D   for (i in 1:(length(yprsim[,1]))){
##D     ii <- roll[i]; jj <- pitch[i]; kk <- tilt$heading[i]
##D     animalplot3d(ii, jj, kk,angle = "radian")
##D     par3d(windowRect = c(50,50,700,700)) # make the window a bit larger.
##D     #save each plot as a png
##D     rgl.snapshot(filename=paste(filename,as.character(i),".png",sep=""),fmt="png") 
##D   }
## End(Not run)





