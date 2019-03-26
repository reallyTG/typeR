library(PROTOLIDAR)


### Name: LWA_lidar_function
### Title: Leaf Wall Area (LWA) measured in m^2*ha^-1.
### Aliases: LWA_lidar_function
### Keywords: math

### ** Examples

## Should be DIRECTLY executable !! ----
  height_canopy = 2 ## this value is the maximum of Height_canopy_function.
  ground_area = 10000 ## generally is one hectare in m^2.
  row_spacing = 2.9 ## measured in meters.

## The function is currently defined as
function(height_canopy,ground_area,row_spacing){

 LWA <- 2* height_canopy * (ground_area/row_spacing)

return(LWA)

  }
  LWA_lidar_function(height_canopy,ground_area,row_spacing)



