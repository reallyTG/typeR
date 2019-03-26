library(AFM)


### Name: performAllPSDCalculation
### Title: Perform all the calculation for PSD exploitation
### Aliases: performAllPSDCalculation

### ** Examples

## Not run: 
##D library(AFM)
##D 
##D data(AFMImageOfNormallyDistributedHeights)
##D 
##D newAFMImage<-AFMImageOfNormallyDistributedHeights
##D newAFMImage@fullfilename<-"C:/Users/one/AFMImageOfNormallyDistributedHeights.txt"
##D psdAnalysis<-AFMImagePSDAnalysis()
##D # Create a closure to update progress
##D psdAnalysis@updateProgress<- function(value = NULL, detail = NULL, message = NULL) {
##D   if (exists("progressPSD")){
##D     if (!is.null(message)) {
##D       progressPSD$set(message = message, value = 0)
##D     }else{
##D       progressPSD$set(value = value, detail = detail)
##D     }
##D   }
##D }
##D psdAnalysis@psd1d_breaks<-2^3
##D psdAnalysis@psd2d_truncHighLengthScale<-TRUE
##D psdAnalysis<-performAllPSDCalculation(AFMImagePSDAnalysis= psdAnalysis, AFMImage= newAFMImage)
##D print("done psdAnalysis")
## End(Not run)



