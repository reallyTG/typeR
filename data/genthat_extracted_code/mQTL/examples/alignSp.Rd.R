library(mQTL)


### Name: alignSp
### Title: Base function for Spectrum Alignment
### Aliases: alignSp
### Keywords: function

### ** Examples


## Not run: 
##D ## Data
##D 
##D Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)
##D 
##D ##Segmentation parameters
##D 
##D peakParam=list()
##D peakParam$ppmDist <- 0.03 #(ppm)  # distance to concatenate adjacent peaks #default 0.03# 
##D peakParam$ampThr <- 0.3 # amplitude value to threshold small peaks
##D peakParam$minPeakWidth <- 0.005 # min peak width in ppm scale
##D peakParam$iFrameLen<-11 # Savitzky-Golay frame length in ppm scale
##D peakParam$iOrder<-3 # polynomial order of Savitzky - Golay filter
##D peakParam$peakEdgeMax<-0.2 # maximal peak edge 
##D 
##D ##Recusrsion alignment parameters
##D 
##D recursion=list()
##D recursion$resamblance<-0.95# Stop criterium of the recursion indicating
##D #the complete alignment of segment peaks
##D recursion$segShift<-0.02#(ppm)  max peak shift for large peaks
##D recursion$inbetweenShift<-0.02 #(ppm) max shift for small peaks
##D recursion$acceptance<-0.5 # if resemblance after the alignment between modified test 
##D recursion$minSegWidth<-0.01 #(ppm) Stop criteria of the recursion - the size of the smallest peak
##D recursion$step<-0.02 # Recursion step (default 0.02)
##D 
##D ## Normalisation 
##D 
##D normD<-normalise(Sp,'prob')
##D 
##D ## Reference spectrum selection
##D  
##D index<-selectRefSp(normD$Sp,recursion$step)
##D refSp<-normD$Sp[index,] # reference spectrum picked-up
##D 
##D ##segmentate a reference spectrum
##D 
##D refSegments<- segmentateSp(refSp, peakParam) # segmentate reference spectrum
##D 
##D ##segmentate a test spectrum
##D 
##D spectrum<-normD$Sp[10,]
##D testSegments<- segmentateSp(spectrum, peakParam) # segmentate test spectrum (10th sample)
##D 
##D #match test and reference segments
##D 
##D attachedSegs<-attachSegments(refSegments,testSegments)
##D 
##D refSegments<-attachedSegs$refSegmentsNew
##D testSegments<-attachedSegs$testSegmentsNew
##D 
##D ##matching parameters
##D 
##D MAX_DIST_FACTOR<-0.5 # The distance matching parameter (0.5*peak_width)
##D MIN_RC<-0.25 # Minimum resamblance coefficient
##D 
##D Segs<-matchSegments(refSp,spectrum, testSegments,refSegments,MAX_DIST_FACTOR,MIN_RC)
##D 
##D 
##D #align a test spectrum
##D  
##D refSgs<-Segs$refSegs
##D tstSgs<-Segs$testSegs
##D 
##D SpAlg<- alignSp(refSp,refSgs,spectrum,tstSgs,recursion,MAX_DIST_FACTOR,MIN_RC)
## End(Not run)



