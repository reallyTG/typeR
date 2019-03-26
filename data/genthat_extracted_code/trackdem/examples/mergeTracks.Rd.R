library(trackdem)


### Name: mergeTracks
### Title: Merge track records
### Aliases: mergeTracks

### ** Examples

## Not run: 
##D ## Create image sequence
##D dir.create("images")
##D traj <- simulTrajec(path="images",
##D                     nframes=60,nIndividuals=20,domain="square",
##D                     h=0.01,rho=0.9,sizes=runif(20,0.004,0.006))
##D ## Analyse first part
##D dir <- "images"
##D allFullImages1 <- loadImages (dirPictures=dir,nImages=1:30)
##D stillBack1 <- createBackground(allFullImages1)
##D allImages1 <- subtractBackground(bg=stillBack1)
##D partIden1 <- identifyParticles(sbg=allImages1,
##D                               pixelRange=c(1,500),
##D                               threshold=-0.1)
##D records1 <- trackParticles(partIden1,L=20,R=2)
##D ## Analyse second part
##D allFullImages2 <- loadImages (dirPictures=dir,nImages=31:60)
##D stillBack2 <- createBackground(allFullImages2)
##D allImages2 <- subtractBackground(bg=stillBack2)
##D partIden2 <- identifyParticles(sbg=allImages2,
##D                               pixelRange=c(1,500),
##D                               threshold=-0.1)
##D records2 <- trackParticles(partIden2,L=20,R=2)
##D ## Merge tracks
##D records <- mergeTracks(records1,records2)
##D plot(records,colorimages=allFullImages1,type="trajectories",incThres=10)
## End(Not run)



