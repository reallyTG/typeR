library(PROTOLIDAR)


### Name: TRV_lidar_function
### Title: Tree Row Volume (TRV).
### Aliases: TRV_lidar_function
### Keywords: array

### ** Examples

## Should be DIRECTLY executable !! ----
## Here need use:  Height_canopy_function and Width_canopy_function or values measured manually.
 height_canopy <- 1.995 ## the value is the result of Height_canopy_function.
 width_canopy <- 0.426 ## the value is the result of Width_canopy_function.
 row_spacing = 2.9 ## measured in meters.

## The function is currently defined as
TRV_lidar_function <- function(height_canopy,width_canopy,row_spacing){
TRV <-height_canopy * width_canopy * 10000  / row_spacing
return(TRV)
  }
  TRV <- TRV_lidar_function(height_canopy,width_canopy,row_spacing)



