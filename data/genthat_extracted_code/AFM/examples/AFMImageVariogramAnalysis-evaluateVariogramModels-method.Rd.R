library(AFM)


### Name: evaluateVariogramModels
### Title: evaluateVariogramModels method to evaluate the basic variogram
###   models
### Aliases: evaluateVariogramModels evaluateVariogramModels
###   evaluateVariogramModels,AFMImageVariogramAnalysis-method

### ** Examples

library(AFM)

data("AFMImageOfRegularPeaks")
# take an extract of the image to fasten the calculation      
AFMImage<-extractAFMImage(AFMImageOfRegularPeaks, 40, 40, 32)
# e.g. AFMImage@fullfilename<-"/users/ubuntu/AFMImageOfRegularPeaks-extract.txt"
AFMImage@fullfilename<-paste(tempdir(), "AFMImageOfRegularPeaks-extract.txt", sep="/")
 
AFMImageAnalyser<-AFMImageAnalyser(AFMImage)
 
 # Variogram analysis 
sampleFitPercentage<-3.43/100
variogramAnalysis<-AFMImageVariogramAnalysis(sampleFitPercentage)
variogramAnalysis@omnidirectionalVariogram<- 
              AFM::calculateOmnidirectionalVariogram(AFMImage=AFMImage,
                                                     AFMImageVariogramAnalysis=variogramAnalysis)
variogramAnalysis@directionalVariograms<- 
              AFM::calculateDirectionalVariograms(AFMImage=AFMImage,
                                                 AFMImageVariogramAnalysis=variogramAnalysis)
 
# manage model evaluations
AFMImageVariogram<-variogramAnalysis@omnidirectionalVariogram
class(AFMImageVariogram)=c("gstatVariogram","data.frame")
variogramAnalysis<-evaluateVariogramModels(variogramAnalysis, AFMImage)

mergedDT<-getDTModelEvaluation(variogramAnalysis)
mergedDT
sillRangeDT<-getDTModelSillRange(variogramAnalysis)
sillRangeDT




