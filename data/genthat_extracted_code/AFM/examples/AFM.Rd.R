library(AFM)


### Name: AFM
### Title: Atomic Force Microscopy images tools
### Aliases: AFM AFM-package

### ** Examples

## Not run: 
##D   library(AFM)
##D # Analyse the AFMImageOfRegularPeaks AFM Image from this package
##D   data("AFMImageOfRegularPeaks")
##D   AFMImage<-AFMImageOfRegularPeaks
##D # exportDirectory="C:/Users/my_windows_login" or exportDirectory="/home/ubuntu"
##D   exportDirectory=tempdir()
##D   AFMImage@fullfilename<-paste(exportDirectory,"AFMImageOfRegularPeaks.txt",sep="/")
##D   
##D # Start to check if your sample is normaly distributed and isotropic.
##D   generateCheckReport(AFMImage)
##D   
##D # If the sample is normaly distributed and isotropic, generate a full report
##D   generateReport(AFMImage)
##D   
## End(Not run)



