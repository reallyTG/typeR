library(mQTL)


### Name: matchSegments
### Title: Matching of the segment of interest to the corresponding
###   reference
### Aliases: matchSegments
### Keywords: function

### ** Examples


## Not run: 
##D 
##D # Data
##D 
##D Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)
##D 
##D ##Segmentation parameters
##D 
##D peakParam=list()
##D peakParam$ppmDist <- 0.03# (ppm)  # distance to concatenate adjacent peaks #default 0.03# 
##D peakParam$ampThr <- 0.3 # amplitude value to threshold small peaks # 
##D peakParam$minPeakWidth <- 0.005 #min peak width in ppm scale
##D peakParam$iFrameLen<-11 #Savitzky-Golay frame length in ppm scale
##D peakParam$iOrder<-3 #polynomial order of Savitzky - Golay filter
##D peakParam$peakEdgeMax<-0.2 
##D 
##D ##reference spectrum selection
##D 
##D step=0.02 # Recursion step (default 0.02)
##D index<-selectRefSp(Sp,step)
##D refSp<-Sp[index,]
##D 
##D #segmentate a reference spectrum
##D 
##D refSegments<- segmentateSp(refSp, peakParam) # segmentate reference spectrum
##D 
##D #segmentate a test spectrum
##D 
##D spectrum<-Sp[10,]
##D testSegments<- segmentateSp(spectrum, peakParam) # segmentate test spectrum (10th sample)
##D 
##D #attach test and reference segments
##D attachedSegs<-attachSegments(refSegments,testSegments)
##D 
##D ##Matching parameters
##D 
##D MAX_DIST_FACTOR<-0.5 # The distance matching parameter (0.5*peak_width)
##D MIN_RC<-0.25 # Minimum resamblance coefficient
##D 
##D refSegments<-attachedSegs$refSegmentsNew
##D testSegments<-attachedSegs$testSegmentsNew
##D Segs<-matchSegments(refSp,spectrum, testSegments,refSegments,MAX_DIST_FACTOR, MIN_RC)
## End(Not run)



