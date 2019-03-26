library(move)


### Name: thinTrackTime
### Title: Thinning trajectories to a specific time interval or distance.
### Aliases: thinTrackTime thinDistanceAlongTrack
###   thinTrackTime,.MoveTrackSingle-method
###   thinDistanceAlongTrack,.MoveTrackSingle-method

### ** Examples

data("leroy")
leroysub <- leroy[1:200]
### selecting those segments that have a time interval of 15mins pulsminus 5mins
thintime <- thinTrackTime(leroysub, interval = as.difftime(15, units='mins'),
                          tolerance = as.difftime(5, units='mins'))
summary(timeLag(thintime,"mins")[thintime@burstId=="selected"])

### selecting those segments that have a distance of 100m pulsminus 10m
thindist <- thinDistanceAlongTrack(leroysub, interval = 100, tolerance = 10)
summary(distance(thindist)[thindist@burstId=="selected"])

## Don't show: 
timeLag(thinTrackTime(move(1:40, 1:40, Sys.time()+1:40), 
as.difftime(5, units='secs'), as.difftime(1, units='secs')), units='secs')

timeLag(thinTrackTime(move(1:41, 1:41, Sys.time()+1:41), 
as.difftime(5, units='secs'), as.difftime(1, units='secs')), units='secs')
## End(Don't show)



