library(move)


### Name: burstId
### Title: Returns or sets the burstId
### Aliases: burstId burstId<- burstId,MoveBurst-method
###   burstId,.MoveTrackSingleBurst-method
###   burstId<-,.MoveTrackSingleBurst,factor-method
###   burstId<-,.MoveTrackSingleBurst,character-method

### ** Examples

data(leroy)
burstTrack <- burst(x=leroy,f=months(timestamps(leroy))[-1])
burstId(burstTrack)



