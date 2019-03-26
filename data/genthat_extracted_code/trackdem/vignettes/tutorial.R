### R code from vignette source 'tutorial.Rnw'

###################################################
### code chunk number 1: allresults
###################################################
load("allResults.RData")

#save('allFullImages','stillBack','allImages','partIden',
#     'records','results','finalNN', file='allResults.RData')



###################################################
### code chunk number 2: simul (eval = FALSE)
###################################################
## require(trackdem)
## dir.create("images")
## set.seed(1000)
## ## Create image sequences
## traj <- simulTrajec(path="images",
##                     nframes=30,nIndividuals=15,domain="square",
##                     h=0.01,rho=0.9,
##                     sizes=runif(15,0.004,0.006))


###################################################
### code chunk number 3: loadImageSeq (eval = FALSE)
###################################################
## dir <- "images"
## allFullImages <- loadImages (dirPictures=dir,nImages=1:30)


###################################################
### code chunk number 4: loadImageSeqPrint
###################################################
allFullImages
class(allFullImages)


###################################################
### code chunk number 5: plot (eval = FALSE)
###################################################
## plot(allFullImages,frame=1)


###################################################
### code chunk number 6: makeBackground (eval = FALSE)
###################################################
## ## Detect background
## stillBack <- createBackground(allFullImages,method="mean")


###################################################
### code chunk number 7: makeBackgroundPrint
###################################################
class(stillBack)
stillBack


###################################################
### code chunk number 8: plotBackground (eval = FALSE)
###################################################
## plot(stillBack)


###################################################
### code chunk number 9: BackgroundNoise (eval = FALSE)
###################################################
## dir.create('imagesNoise')
## trajNoise <- simulTrajec(path="imagesNoise",
##                     nframes=30,nIndividuals=20,domain='circle',
##                     h=0.01,rho=0.9,staticNoise=TRUE,
##                     sizes=runif(20,0.004,0.006))
## dir <- "imagesNoise"
## allFullImagesNoise <- loadImages (dirPictures=dir,nImages=1:30)
## stillBackNoise <- createBackground(allFullImagesNoise,method="mean")
## plot(stillBackNoise)


###################################################
### code chunk number 10: substrBackground (eval = FALSE)
###################################################
## allImages <- subtractBackground(bg=stillBack)


###################################################
### code chunk number 11: identifyParticles (eval = FALSE)
###################################################
## ## Identify moving particles
## partIden <- identifyParticles(sbg=allImages,threshold=-0.1,
##                               pixelRange=c(1,500),
##                               autoThres=FALSE)


###################################################
### code chunk number 12: identifyParticlesPrint
###################################################
summary(partIden)


###################################################
### code chunk number 13: plotpartIden (eval = FALSE)
###################################################
## plot(partIden,frame=10)


###################################################
### code chunk number 14: trackParticles (eval = FALSE)
###################################################
## ## Reconstruct trajectories
## records <- trackParticles(partIden,L=60,R=3)


###################################################
### code chunk number 15: SummaryParticles
###################################################
summary(records, incThres=1)


###################################################
### code chunk number 16: records2
###################################################
# population count
summary(records,incThres=1)$N

# median body sizes
summary(records,incThres=1)$particles[,"Size"]

# total displacement (in pixels)
summary(records,incThres=1)$particles[,"Total movement"]

# area covered by particles as a fraction of the total area
summary(records,incThres=1)$area

# minimum number of frames that a tracked particle 
# should be present (value z)
summary(records,incThres=1)$presence


###################################################
### code chunk number 17: records
###################################################
## x and y coordinates for each trajectory (rows), per frame (columns)
dim(records$trackRecord)

## particle sizes (in pixels) for each trajectory (rows), per frame (columns)
dim(records$sizeRecord)

## RGB color values for each trajectory (rows), per frame (columns)
dim(records$colorRecord)


###################################################
### code chunk number 18: plotRecords (eval = FALSE)
###################################################
## ## Plot reconstructed trajectories
## plot(records,type="trajectories",incThres=1)
## 
## ## Add simulated trajectories
## for (i in 1:length(unique(traj$id))) {
##   lines(traj$x[traj$id==i],traj$y[traj$id==i],col="grey",
## 	    lty=2,lwd=2)
## }


###################################################
### code chunk number 19: noise (eval = FALSE)
###################################################
## dir.create("images")
## traj <- simulTrajec(path="images",
##                     nframes=30,nIndividuals=20,domain="square",
##                     h=0.01,rho=0.9,staticNoise=FALSE,movingNoise=TRUE,
##                     parsMoving = list(density = 20, duration = 10, size =1, 
##                                       speed = 10, colRange = c(0, 1)),
##                     sizes=runif(20,0.004,0.006))
## 
## ## Run trackdem
## allFullImages <- loadImages (dirPictures="images/",
##                              nImages=1:30)
## stillBack <- createBackground(allFullImages)
## allImages <- subtractBackground(bg=stillBack)
## partIden <- identifyParticles(sbg=allImages,
##                               threshold=-0.1,select="dark",
##                               pixelRange=c(1,500))


###################################################
### code chunk number 20: tmp1 (eval = FALSE)
###################################################
## mId <- manuallySelect(particles=partIden,frame=10)


###################################################
### code chunk number 21: createTraining (eval = FALSE)
###################################################
## # select the nframes with the most identified particles
## nframes <- 3
## frames <- order(tapply(partIden$patchID,partIden$frame,length),
##                 decreasing=TRUE)[1:nframes]
## mId <- manuallySelect(particles=partIden,frames=frames)


###################################################
### code chunk number 22: testTraining (eval = FALSE)
###################################################
## finalNN <- testNN(dat=mId,repetitions=10,maxH=4,prop=c(6,2,2))


###################################################
### code chunk number 23: outputnn
###################################################
finalNN
summary(finalNN)


###################################################
### code chunk number 24: trackParticlesNN (eval = FALSE)
###################################################
## partIdenNN <- update(partIden,finalNN) # update with neural net
## recordsNN <- trackParticles(partIdenNN,L=60,R=3)
## summary(recordsNN)


###################################################
### code chunk number 25: batchSetup (eval = FALSE)
###################################################
## # simulate 3 image sequences
## wd <- getwd()
## folders <- paste0(rep("images",3),1:3)
## populations <- c(15,25,50)
## dir.create("./batchTest")
## setwd("./batchTest")	
## for(i in 1:length(folders)){
##   dir.create(folders[i])
##   set.seed(i)
##   traj <- simulTrajec(path=folders[i],
##                       nframes=30,nIndividuals=populations[i],
##                       h=0.01,rho=0.9,sizes=runif(populations[i],0.004,0.006))
## }


###################################################
### code chunk number 26: recordsAtt
###################################################
  attributes(records)$settings 


###################################################
### code chunk number 27: batch (eval = FALSE)
###################################################
## setwd(wd)
## batchpath <- "./batchTest"
## results <- runBatch(path=batchpath,settings=records,incThres=10)


###################################################
### code chunk number 28: batchshow
###################################################
results


###################################################
### code chunk number 29: batch2 (eval = FALSE)
###################################################
## ## Manual batch analysis
## results <- data.frame(movie=folders,n=NA)
## setwd("./batchTest")	
## for (i in 1:length(folders)) {
##   direc <- folders[i]
##   allFullImages <- loadImages (dirPictures=direc,nImages=1:30)
##   stillBack <- createBackground(allFullImages,method="mean")
##   allImages <- subtractBackground(bg=stillBack)
##   partIden <- identifyParticles(sbg=allImages,
##                                 threshold=-0.1, # chosen threshold
##                                 pixelRange=c(1,500)) # min and max size
##   records <- trackParticles(partIden,L=60,R=3)
##   ## save the population count to view in R after the run
##   results$n[i] <- summary(records,incThres=10)$N
## 
##   ## Check output
##   pdf(paste0(direc,'.pdf'))
##   plot(partIden,frame=1)
##   plot(records,type='trajectories',incThres=10)
##   dev.off()
##   
##   ## save the recorded size per particle per frame to the HD
##   ## access in R with readRDS later 
##   saveRDS(records$sizeRecord,file=paste0("sizeRecord_",folders[i],".rds"))
##   
##   ## clean previous large objects - this may speed up the run if these 
##   ## are large
##   rm("allFullImages","stillBack","allImages")
## }


###################################################
### code chunk number 30: merge (eval = FALSE)
###################################################
## dir.create("images")
## set.seed(100)
## ## Create image sequence
## traj <- simulTrajec(path="images",
##                     nframes=60,nIndividuals=20,domain="square",
##                     h=0.01,rho=0.9,movingNoise=FALSE,
##                     sizes=runif(20,0.004,0.006))
## 
## dir <- "images"
## ## Load and analyze images 1-30
## allFullImages1 <- loadImages (dirPictures=dir,nImages=1:30)
## stillBack1 <- createBackground(allFullImages1)
## allImages1 <- subtractBackground(bg=stillBack1)
## partIden1 <- identifyParticles(sbg=allImages1,
##                                pixelRange=c(1,500),
##                                threshold=-0.1)
## records1 <- trackParticles(partIden1,L=20,R=2)
## rm(list = c("allFullImages1", "stillBack1", "allImages1", 
##             "partIden1"))
## gc()                
## 
## ## Load and analyze images 31-60
## allFullImages2 <- loadImages (dirPictures=dir,nImages=31:60)
## stillBack2 <- createBackground(allFullImages2)
## allImages2 <- subtractBackground(bg=stillBack2)
## partIden2 <- identifyParticles(sbg=allImages2,
##                               pixelRange=c(1,500),
##                               threshold=-0.1)
## records2 <- trackParticles(partIden2,L=20,R=2)
## 
## ## Merge tracked objects
## records <- mergeTracks(records1,records2)
## plot(records,colorimages=allFullImages2,type="trajectories")
## 


###################################################
### code chunk number 31: libav (eval = FALSE)
###################################################
## # sudo apt-get update
## # sudo apt-get install libav-tools
## # sudo apt-get install libimage-exiftool-perl


###################################################
### code chunk number 32: libavMac (eval = FALSE)
###################################################
## ## Make sure that homebrew is installed, see: https://brew.sh/
## 
## ## Install libav
## # brew install libav


###################################################
### code chunk number 33: createImageSeq (eval = FALSE)
###################################################
## createImageSeq(imagepath="ImageSequences", moviepath="Movies",
##                fps=15, nsec=2, ext="MTS",libavpath=NULL,
##                exiftoolpath=NULL, pythonpath=NULL)


