library(AFM)


### Name: exportToSTL
### Title: Export an AFM Image as a STL format file.
### Aliases: exportToSTL

### ** Examples

## Not run: 
##D library(AFM)
##D data("AFMImageOfRegularPeaks")
##D AFMImage<-AFMImageOfRegularPeaks
##D # calculate the 3D model : surface and the faces
##D AFMImage3DModelAnalysis<-new ("AFMImage3DModelAnalysis")
##D AFMImage3DModelAnalysis<-calculate3DModel(AFMImage3DModelAnalysis= AFMImage3DModelAnalysis,
##D                                           AFMImage= AFMImage)
##D # export the 3D model to file
##D exportDirectory=tempdir()
##D print(paste("saving model in ", exportDirectory))
##D exportToSTL(AFMImage3DModelAnalysis=AFMImage3DModelAnalysis,
##D             AFMImage=AFMImage, 
##D             stlfullfilename=paste(exportDirectory, "myFile.stl", sep="/"))
## End(Not run)



