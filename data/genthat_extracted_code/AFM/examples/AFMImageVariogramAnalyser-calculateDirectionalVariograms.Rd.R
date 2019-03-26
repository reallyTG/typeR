library(AFM)


### Name: calculateDirectionalVariograms
### Title: Calculate experimental directional semi-variograms
### Aliases: calculateDirectionalVariograms

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D 
##D data(AFMImageOfRegularPeaks)
##D variogramAnalysis<-AFMImageVariogramAnalysis(sampleFitPercentage=3.43/100)
##D varios<-AFM::calculateDirectionalVariograms(AFMImage= AFMImageOfRegularPeaks, 
##D                                             AFMImageVariogramAnalysis= variogramAnalysis)
##D dist<-gamma<-NULL
##D p <- ggplot(varios, aes(x=dist, y=gamma,  
##D                         color= as.factor(dir.hor), 
##D                         shape=as.factor(dir.hor)))
##D p <- p + expand_limits(y = 0)
##D p <- p + geom_point()
##D p <- p + geom_line()
##D p <- p + ylab("semivariance (nm^2)")
##D p <- p + xlab("distance (nm)")
##D p <- p + ggtitle("Directional")
##D p
## End(Not run)



