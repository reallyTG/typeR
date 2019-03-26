library(animalTrack)


### Name: pitch
### Title: Calculate pitch angle.
### Aliases: pitch

### ** Examples


## Import the yaw, pitch and roll simulated calibration dataset. For
## an explanation of the data use help(yprsim).
data(yprsim)

## Calculate pitch (the nose/x-axis is rotated downward through 2 full rotations)
phi <- pitch(yprsim$ax,yprsim$ay,yprsim$az)

## Plot
plot(phi*(180/pi),type='l',lty=1,lwd=2,xlab="time (s)",ylab="pitch (degrees)",
     main="Pitch Calculation (2 pitch rotations)")
abline(v=c(126,252),lty=3,lwd=2)
legend(-10,70,legend=c("Pitch","Change in \n Rotation"),col=c("black","black"),
       lty=c(1,3),bty="n")
text(50,-70,"Yaw");text(175,-70,"Pitch");text(320,-70,"Roll")




