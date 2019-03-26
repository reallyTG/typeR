library(moveWindSpeed)


### Name: getWindEstimates
### Title: Generate wind estimates for a trajectories or data frame with
###   wind speeds
### Aliases: getWindEstimates getWindEstimates,MoveStack,missing-method
###   getWindEstimates,Move,missing-method
###   getWindEstimates,data.frame,POSIXct-method
###   getWindEstimates,list,ANY-method

### ** Examples

data("storks")
# run example for reduced dataset
windEst<-getWindEstimates(storks[format(timestamps(storks),"%H")=="12",][[2:3]])
windEst<-spTransform(windEst, center=TRUE)
plot(windEst)
# only plot few arrows of estimates
s<-windEst$estimationSuccessful & format(timestamps(windEst), "%S")=='00'
# enlarge arrows 30 times
arrows(coordinates(windEst)[s,1],coordinates(windEst)[s,2],
   coordinates(windEst)[s,1]+ windEst$windX[s]*30,
   coordinates(windEst)[s,2]+windEst$windY[s]*30)



