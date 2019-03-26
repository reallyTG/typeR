library(FRK)


### Name: BAUs_from_points
### Title: Creates pixels around points
### Aliases: BAUs_from_points BAUs_from_points,SpatialPoints-method
###   BAUs_from_points,ST-method

### ** Examples

library(sp)
opts_FRK$set("parallel",0L)
df <- data.frame(x = rnorm(10),
                 y = rnorm(10))
coordinates(df) <- ~x+y
BAUs <- BAUs_from_points(df)



