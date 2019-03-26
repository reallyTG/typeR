library(AFM)


### Name: PSD2DAgainstFrequency
### Title: Calculate the 2D Power Spectral Density
### Aliases: PSD2DAgainstFrequency PSD2DAgainstFrequency,AFMImage-method

### ** Examples

## Not run: 
##D library(AFM)
##D library(ggplot2)
##D library(plyr)
##D 
##D # Calculate Power Spectrum Density in 2D against frequency
##D data("AFMImageOfNormallyDistributedHeights")
##D oneAFMImage<-AFMImageOfNormallyDistributedHeights
##D psd2d<-PSD2DAgainstFrequency(oneAFMImage)
##D p <- ggplot(data=psd2d)
##D p <- p + geom_point(aes(freq, PSD, color=type),subset = .(type %in% c("PSD-2D")))
##D p <- p + geom_line(aes(freq, PSD, color=type),subset = .(type %in% c("PSD-1D")),size=1.1)
##D p <- p + scale_x_log10()
##D p <- p + scale_y_log10()
##D p <- p + ylab("PSD (nm^4)")
##D p <- p + xlab("Frequency (nm^-1)")
##D p <- p + ggtitle(basename(oneAFMImage@fullfilename))
##D p
## End(Not run)



