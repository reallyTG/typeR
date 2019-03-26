library(mQTL)


### Name: segmentateSp
### Title: Segmentation of a spectrum of interest
### Aliases: segmentateSp
### Keywords: methods

### ** Examples


# Data

Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)

##Segmentation parameters

peakParam=list()
peakParam$ppmDist <- 0.03# (ppm)  # distance to concatenate adjacent peaks #default 0.03# 
peakParam$ampThr <- 0.3 # amplitude value to threshold small peaks # 
peakParam$minPeakWidth <- 0.005 #min peak width in ppm scale
peakParam$iFrameLen<-11 #Savitzky-Golay frame length in ppm scale
peakParam$iOrder<-3 #polynomial order of Savitzky - Golay filter
peakParam$peakEdgeMax<-0.2 

#segmentate a test spectrum (10th sample)

Spectr<-Sp[10,]
testSegments<- segmentateSp(Spectr, peakParam) 



