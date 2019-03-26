library(AFM)


### Name: PSD1DAgainstFrequency
### Title: Calculate the 1D Power Spectral Density; returns a data table of
###   PSD 1D and PSD 2D values against spatial frequencies. As mentionned
###   in Sidick2009, this function calculates the PSD against spatial
###   frequencies in 1D from 'PSD2DAgainstFrequency' by using breaks in the
###   log space to sum PSD 2D and frequency values.
### Aliases: PSD1DAgainstFrequency PSD1DAgainstFrequency,AFMImage-method

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D library(plyr)
##D library(scales)
##D data("AFMImageOfNormallyDistributedHeights")
##D  newAFMImage<-AFMImageOfNormallyDistributedHeights
##D newAFMImage@fullfilename<-"C:/Users/one/AFMImageOfNormallyDistributedHeights.txt"
##D psdAnalysis<-AFMImagePSDAnalysis()
##D # Create a closure to update progress
##D psdAnalysis@updateProgress<- function(value = NULL, detail = NULL, message = NULL) {
##D   if (exists("progressPSD")){
##D    if (!is.null(message)) {
##D      progressPSD$set(message = message, value = 0)
##D    }else{
##D      progressPSD$set(value = value, detail = detail)
##D    }
##D   }
##D }
##D psdAnalysis@psd1d_breaks<-2^3
##D psdAnalysis@psd2d_truncHighLengthScale<-TRUE
##D psdAnalysis<-performAllPSDCalculation(AFMImagePSDAnalysis= psdAnalysis, AFMImage= newAFMImage)
##D datap<-psdAnalysis@psd1d
##D p <- ggplot(data=datap)
##D p <- p + geom_point(aes(freq, PSD, color=type),data=datap[datap$type %in% c("PSD-2D")])
##D p <- p + geom_line(aes(freq, PSD, color=type),data=datap[datap$type %in% c("PSD-1D")],size=1.1)
##D p <- p + scale_x_log10()
##D p <- p + scale_y_log10()
##D p <- p + ylab("PSD (nm^4)")
##D p <- p + xlab("Frequency (nm^-1)")
##D p
## End(Not run)



