library(PROTOLIDAR)


### Name: LAI_function
### Title: Leaf Area Index (LAI) calculate from LIDAR scan.
### Aliases: LAI_function
### Keywords: array

### ** Examples

## Should be DIRECTLY executable !! ----
## Here needed some inputs measured manually like leaf area (m^2) and number of leaves.
  number_of_leaves <- 420
  leaf_area <- 0.010 ## measured in m^2.
  row_distance <- 2.9 ## measured in meters.
  in_row_distance <- 1.4 ## measured in meters.

## The function is currently defined as
LAI_function <- function(Number_of_leaves_by_plant,Leaf_Area,in_row_distance){

 LAI <- Number_of_leaves_by_plant * Leaf_Area / in_row_distance

return(LAI)

  }
  LAI_function(number_of_leaves,leaf_area,in_row_distance)



