library(MotilityLab)


### Name: projectDimensions
### Title: Extract Spatial Dimensions
### Aliases: projectDimensions

### ** Examples

## Compare 2D and 3D speeds
speed.2D <- mean( sapply( subtracks( projectDimensions( TCells, c("x","z") ), 2 ), speed ) )
speed.3D <- mean( sapply( TCells, speed ) )




