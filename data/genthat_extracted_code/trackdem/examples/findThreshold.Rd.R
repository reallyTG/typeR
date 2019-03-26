library(trackdem)


### Name: findThreshold
### Title: Find threshold
### Aliases: findThreshold

### ** Examples

## Not run: 
##D dir.create("images")
##D ## Create image sequence
##D traj <- simulTrajec(path="images",
##D                     nframes=30,nIndividuals=20,domain="square",
##D                     h=0.01,rho=0.9,
##D                     sizes=runif(20,0.004,0.006))
##D ## Load images
##D dir <- "images"
##D allFullImages <- loadImages (dirPictures=dir,nImages=1:30)
##D stillBack <- createBackground(allFullImages,method="mean")
##D allImages <- subtractBackground(stillBack)
##D thr <- findThreshold(allImages,frame=10)
## End(Not run)



