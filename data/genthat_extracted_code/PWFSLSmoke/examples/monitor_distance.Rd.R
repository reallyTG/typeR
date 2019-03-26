library(PWFSLSmoke)


### Name: monitor_distance
### Title: Calculate Distances From ws_monitor Monitors to Location of
###   Interest
### Aliases: monitor_distance
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
# Walla Walla
WW_lon <- -118.330278
WW_lat <- 46.065
distance <- monitor_distance(N_M, WW_lon, WW_lat)
closestIndex <- which(distance == min(distance))
distance[closestIndex]
N_M$meta[closestIndex,]



