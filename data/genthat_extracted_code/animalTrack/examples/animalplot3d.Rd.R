library(animalTrack)


### Name: animalplot3d
### Title: Make a 3D rotated plot of animal orientation based on roll,
###   pitch, and yaw angles.
### Aliases: animalplot3d

### ** Examples


## Animal with a roll angle of 30 degrees, and a pitch angle of 10 degrees
roll <- 30
pitch <- 10
yaw <- 0

animalplot3d(roll,pitch,yaw,angle = "degree")

## Make the plot a bit larger
par3d(windowRect = c(50,50,700,700)) 

## Add another animal orientation with the same roll and pitch, but a 40 degree yaw.
animalplot3d(roll,pitch,40,angle = "degree", add=TRUE)





