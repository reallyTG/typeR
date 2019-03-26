library(AFM)


### Name: calculateOmnidirectionalVariogram
### Title: Calculate experimental omnidirectional semi-variogram
### Aliases: calculateOmnidirectionalVariogram

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D 
##D data(AFMImageOfRegularPeaks)
##D variogramAnalysis<-AFMImageVariogramAnalysis(sampleFitPercentage=3.43/100)
##D avario<-AFM::calculateOmnidirectionalVariogram(AFMImageVariogramAnalysis= variogramAnalysis, 
##D                                                AFMImage= AFMImageOfRegularPeaks)
##D dist<-gamma<-NULL
##D p <- ggplot(avario, aes(x=dist, y=gamma))
##D p <- p + geom_point()
##D p <- p + geom_line()
##D p <- p + ylab("semivariance")
##D p <- p + xlab("distance (nm)")
##D p <- p + ggtitle("Experimental semivariogram")
##D p
## End(Not run)



