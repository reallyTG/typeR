library(Data2LD)


### Name: HeadImpactData
### Title: Acceleration of brain tissue before and after a blow to the
###   head.
### Aliases: HeadImpactData
### Keywords: datasets

### ** Examples

HeadImpactTime <- HeadImpactData[,2]  #  time in milliseconds
HeadImpact     <- HeadImpactData[,3]  #  acceleration in millimeters/millisecond^2
HeadImpactRng  <- c(0,60) # Define range time for estimated model
# plot the data along with a unit pulse
plot(HeadImpactTime, HeadImpact, type="p", xlim=c(0,60),  ylim=c(-1.0,1.5),
     xlab="Time (milliseconds)", ylab="Acceleration (mm/msec^2)")
lines(c( 0,60), c(0,0), lty=3)
lines(c(14,14), c(0,1), lty=2)
lines(c(15,15), c(0,1), lty=2)
lines(c(14,15), c(1,1), lty=2)



