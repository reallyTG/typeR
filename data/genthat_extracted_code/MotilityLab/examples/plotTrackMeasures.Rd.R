library(MotilityLab)


### Name: plotTrackMeasures
### Title: Bivariate Scatterplot of Track Measures
### Aliases: plotTrackMeasures

### ** Examples

## Compare speed and straightness of 3 example population tracks.
## To make the comparison fair, analyze subtracks of fixed length.
plotTrackMeasures( subtracks(TCells,4,0), speed, straightness, ellipse.col="black" )
plotTrackMeasures( subtracks(BCells,4,0), speed, straightness,
  col=2, ellipse.col=2, pch=2, add=TRUE )
plotTrackMeasures( subtracks(Neutrophils,4,0), speed, straightness, 
  col=3, ellipse.col=3, pch=3, add=TRUE )



