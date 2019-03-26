library(trackdem)


### Name: runBatch
### Title: Batch analysis
### Aliases: runBatch

### ** Examples

## Not run: 
##D ## Simulate 3 image sequences
##D wd <- getwd()
##D folders <- paste0(rep("images",3),1:3)
##D populations <- c(15,25,50)
##D dir.create("./batchTest")
##D setwd("./batchTest")	
##D for(i in 1:length(folders)){
##D   dir.create(folders[i])
##D   traj <- simulTrajec(path=folders[i],
##D                       nframes=30,nIndividuals=populations[i],
##D                       h=0.01,rho=0.9,
##D                       sizes=runif(populations[i],0.004,0.006))
##D }
##D setwd(wd)
##D batchpath <- "./batchTest"
##D results <- runBatch(path=batchpath,
##D                     nImages=1:30,threshold=-0.1,select='dark',
##D                     pixelRange=c(1,100),L=50,R=3,
##D                     incThres=10)
##D results
## End(Not run)



