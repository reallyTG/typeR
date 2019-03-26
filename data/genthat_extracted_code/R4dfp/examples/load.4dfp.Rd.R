library(R4dfp)


### Name: R4dfp.Load
### Title: Read a 4dfp MRI Image.
### Aliases: R4dfp.Load R4dfp.Print is.4dfp
### Keywords: utilities data

### ** Examples

myimage <- R4dfp.Blank333("myimage.4dfp.ifh")
R4dfp.Save(myimage)

#3 different ways to load an image
myimage <- R4dfp.Load("myimage.4dfp.ifh")
myimage <- R4dfp.Load("myimage.4dfp.ifh",direct.read=TRUE)
myimage <- R4dfp.Load("myimage.4dfp.ifh",direct.write=TRUE)

#retrieve a 3x3x3 cube of voxels
myimage[1:3,1:3,1:3,1]

#set a list of voxels to 0 for all frames
voxels <- NULL
voxels <- rbind(voxels,c(1,1,1))
voxels <- rbind(voxels,c(1,1,2))
voxels <- rbind(voxels,c(1,2,1))
voxels <- rbind(voxels,c(1,2,2))
myimage[voxels] <- 0

#set all voxels to something random
myimage[,,,] <- array(rnorm(prod(myimage$dims)),myimage$dims)

#set everything less than 0 to 0
myimage[myimage[,,,]<0] <- 0



