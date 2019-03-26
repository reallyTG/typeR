library(trackdem)


### Name: manuallySelect
### Title: Manually identify true and false positives with a GUI.
### Aliases: manuallySelect

### ** Examples

## Not run: 
##D dir.create("images")
##D ## Create image sequence
##D traj <- simulTrajec(path="images",
##D                     nframes=30,nIndividuals=20,domain='square',
##D                     h=0.01,rho=0.9,movingNoise=TRUE,
##D                     parsMoving = list(density=20, duration=10, size=1,
##D                                       speed = 10, colRange = c(0,1)),
##D                     sizes=runif(20,0.004,0.006))
##D ## Load images
##D dir <- "images"
##D allFullImages <- loadImages (dirPictures=dir,nImages=1:30)
##D stillBack <- createBackground(allFullImages,method="mean")
##D allImages <- subtractBackground(stillBack)
##D partIden <- identifyParticles(allImages,threshold=-0.1,
##D                                    pixelRange=c(3,400))
##D # select the nframes with the most identified particles
##D nframes <- 3
##D frames <- order(tapply(partIden$patchID,partIden$frame,length),
##D                 decreasing=TRUE)[1:nframes]
##D mId <- manuallySelect(particles=partIden,frame=frames)
## End(Not run)



