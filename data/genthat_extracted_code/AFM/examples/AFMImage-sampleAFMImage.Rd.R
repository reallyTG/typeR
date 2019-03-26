library(AFM)


### Name: sampleAFMImage
### Title: Get a sample of an AFM image.
### Aliases: sampleAFMImage

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D 
##D data(AFMImageOfAluminiumInterface)
##D anAFMImageSample<-sampleAFMImage(AFMImageOfAluminiumInterface,15)
##D variogramAnalysis<-AFMImageVariogramAnalysis(sampleFitPercentage=3.43)
##D avario<-AFM::calculateOmnidirectionalVariogram(AFMImage= anAFMImageSample, 
##D                                                AFMImageVariogramAnalysis= variogramAnalysis)
##D dist<-gamma<-NULL
##D p1 <- ggplot(avario, aes(x=dist, y=gamma))
##D p1 <- p1 + geom_point()
##D p1 <- p1 + geom_line()
##D p1 <- p1 + ylab("semivariance")
##D p1 <- p1 + xlab("distance (nm)")
##D p1 <- p1 + ggtitle("Approximation of variogram thanks to sampling")
##D p1
## End(Not run)




