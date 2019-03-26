library(seewave)


### Name: ggspectro
### Title: 2D-spectrogram of a time wave using ggplot2
### Aliases: ggspectro
### Keywords: dplot ts

### ** Examples

## Not run: 
##D require(ggplot2)
##D ## first layer
##D v <- ggspectro(tico, ovlp=50)
##D summary(v)
##D ## using geom_tile ##
##D v + geom_tile(aes(fill = amplitude)) + stat_contour()
##D ## coordinates flip (interest?)
##D v + geom_tile(aes(fill = amplitude)) + stat_contour() + coord_flip()
##D ## using stat_contour ##
##D # default (not nice at all)
##D v + stat_contour(geom="polygon", aes(fill=..level..))
##D # set up to 30 color levels with the argument bins
##D (vv <- v + stat_contour(geom="polygon", aes(fill=..level..), bins=30))
##D # change the limits of amplitude and NA values as transparent
##D vv + scale_fill_continuous(name="Amplitude\n(dB)\n", limits=c(-30,0), na.value="transparent")
##D # Black-and-white theme
##D (vv + scale_fill_continuous(name="Amplitude\n(dB)\n", limits=c(-30,0),
##D   na.value="transparent", low="white", high="black") + theme_bw())
##D # Other colour scale (close to spectro() default output)
##D v + stat_contour(geom="polygon", aes(fill=..level..), bins=30)
##D   + scale_fill_gradientn(name="Amplitude\n(dB)\n", limits=c(-30,0),
##D   na.value="transparent", colours = spectro.colors(30))
## End(Not run)


