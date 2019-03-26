library(AFM)


### Name: generateCheckReport
### Title: Generate a check report for one AFMImage
### Aliases: generateCheckReport

### ** Examples

## Not run: 
##D library(AFM)
##D 
##D # Analyse the AFMImageOfRegularPeaks AFMImage sample from this package
##D   data("AFMImageOfRegularPeaks")
##D   AFMImage<-AFMImageOfRegularPeaks
##D # exportDirectory="C:/Users/my_windows_login" or exportDirectory="/home/ubuntu"
##D   exportDirectory=tempdir()
##D   AFMImage@fullfilename<-paste(exportDirectory,"AFMImageOfRegularPeaks.txt",sep="/")
##D   
##D # Start to check if your sample is normaly distributed and isotropic.
##D   generateCheckReport(AFMImage)
##D # If the sample is normaly distributed and isotropic, generate a full report
##D   generateReport(AFMImage)
##D 
##D # Analyse your own AFM image from nanoscope analysis (TM) software tool
##D    anotherAFMImage<-importFromNanoscope("c:/users/me/myimage.txt")
##D # Start to check if your sample is normaly distributed and isotropic.
##D    generateCheckReport(anotherAFMImage)
##D # If your sample is normaly distributed and isotropic, generate a full report
##D    generateReport(anotherAFMImage)
## End(Not run)



