library(animalTrack)


### Name: roll
### Title: Calculate roll angle.
### Aliases: roll

### ** Examples

## Import the yaw, pitch and roll simulated calibration dataset. For
## an explanation of the data use help(yprsim).
data(yprsim)

## Assign accelerometer variables
ay <- yprsim$ay
az <- yprsim$az

## Calculate roll
theta <- roll(ay, az)

plot(theta*(180/pi),type='l',lty=1,lwd=2,xlab="time (s)",ylab="pitch (degrees)",
     main="Roll Calculation (2 roll rotations)")
abline(v=c(126,252),lty=3,lwd=2)
legend(-10,110,legend=c("Roll","Change in \n Rotation"),
       col=c("black","black"),lty=c(1,3),bty="n")
text(50,-70,"Yaw");text(175,-70,"Pitch");text(320,-70,"Roll")




