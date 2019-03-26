library(PROTOLIDAR)


### Name: Height_canopy_function
### Title: Height of the canopy measured with LIDAR scan.
### Aliases: Height_canopy_function
### Keywords: array math

### ** Examples

## Should be DIRECTLY executable !! ----
## Data_3D is the output from the Extrac_plant_3D_function.
## For example:
   data (LIDAR_data)
   x <- LIDAR_data[,1]
   y <- LIDAR_data[,2]
   z <- LIDAR_data[,3]
   zdistance <- 190 # total LIDAR scan distance measured in cm.
   miny <- 0 # minimum height of the plant measured in cm.
   maxy <- 2000 # maximum height of the plant measured in cm.
   minx <- 450 # minimum width from where LIDAR starts to measure (cm).
   maxx <- 1470# maximum width from where LIDAR starts to measure (cm).
   minz <- 0 # the beginning of the LIDAR scan measured in cm.
   maxz <- 186 # the end of the LIDAR scan measured in cm (length of interest).
   out <- Extract_plant_grapevine_function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz)
   z_min <- 1.1 
   z_max <- 1.13
   y_min <- 0.4
   y_max <- 0.5
   distance_left <- -0.6
   distance_right <- 0.51
   data_3D <- Extract_plant_3D_function(out,z_min,z_max,y_min,y_max,distance_left,distance_right)
   min_canopy <- 0.4 # is the minimum height of the canopy, approximately . Measured in meters.
   max_canopy <- 2   # is the maximum height of the canopy, approximately . Measured in meters.

## The function is currently defined as
Height_canopy_function <- function(data_3D,distance_left,distance_right,min_canopy,max_canopy){
  x_plant <- y_plant <- z_plant <- NULL
  canopy <- subset(data_3D, data_3D$z_plant >= distance_left & data_3D$z_plant <= distance_right & data_3D$y_plant >= min_canopy & data_3D$y_plant <= max_canopy,select=c(x_plant,y_plant,z_plant))
  mean_height_canopy <- mean(canopy[,2])
  min_height_canopy  <- min(canopy[,2])
  max_height_canopy  <- max(canopy[,2])
  return(data.frame(mean_height_canopy,min_height_canopy,max_height_canopy))
  }
  height_canopy <- Height_canopy_function(data_3D,distance_left,distance_right,min_canopy,max_canopy)[,1]



