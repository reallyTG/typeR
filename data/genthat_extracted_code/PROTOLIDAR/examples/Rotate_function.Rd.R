library(PROTOLIDAR)


### Name: Rotate_function
### Title: Rotate the plants.
### Aliases: Rotate_function
### Keywords: array math

### ** Examples

## Should be DIRECTLY executable !!
## out come from Extract_plant_grapevine_function. The other parameters or inputs are needed to write before.
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
   angle <- 14.96

## The function is currently defined as
Rotate_function <- function(data_3D,angle){
  z <- -data_3D[,3]
  x <-  data_3D[,1]
  x_rot <-c(x*cos(angle)-z*sin(angle))
  y_rot <-c(x*sin(angle)+z*cos(angle))
  return(data.frame(x_rot,y_rot))
  }
  Plants_rotate <- Rotate_function(data_3D,angle)
    x_rot <- Plants_rotate[,1]
    y_rot <- Plants_rotate[,2]
    ##plot
    plot(x_rot,y_rot)



