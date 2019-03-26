library(MotilityLab)


### Name: boundingBox
### Title: Bounding Box of a Tracks Object
### Aliases: boundingBox

### ** Examples

## Use bounding box to set up plot window
bb <- boundingBox(c(TCells,BCells,Neutrophils))
plot( Neutrophils, xlim=bb[,"x"], ylim=bb[,"y"], col=1 )
plot( BCells, col=2, add=TRUE )
plot( TCells, col=3, add=TRUE )



