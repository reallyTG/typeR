library(osc)


### Name: assign.data
### Title: Assign data to clusters
### Aliases: assign.data
### Keywords: utils

### ** Examples

data(landcover)

# clustering urban areas
urban <- cca(landcover, cell.class=1,s=2000, unit="m")
str(urban)

# plot the result    
result <- landcover*NA
result[cellFromXY(result,urban$cluster[,c("long","lat")])]<-urban$cluster[,"cluster_id"]*(-1)
plot(result, col=rainbow(9))

# data.frame with additional information (name)    
data.points <- data.frame(
      long=c(13.26,13.28),
      lat=c(52.34,52.20),
      name=c("Pappelhausen","New Garden")
    )
    
points(data.points$long, data.points$lat, pch="X")
    
assign.data(cluster=urban$cluster, points=data.points, dist=3000)



