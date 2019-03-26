library(MotilityLab)


### Name: subsample
### Title: Subsample Track by Constant Factor
### Aliases: subsample

### ** Examples

## Compare original and subsampled versions of the T cell tracks
plot( TCells, col=1 )
plot( subsample( TCells, 3 ), col=2, add=TRUE, pch.start=NULL )



