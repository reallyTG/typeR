library(DAAG)


### Name: worldRecords
### Title: Record times for track and road races, at August 9th 2006
### Aliases: worldRecords
### Keywords: datasets

### ** Examples

data(worldRecords)
xyplot(log(Time) ~ log(Distance), groups=roadORtrack, data=worldRecords)
xyplot(log(Time) ~ log(Distance), groups=roadORtrack, data=worldRecords,
       type=c("p","r"))
xyplot(log(Time) ~ log(Distance), groups=roadORtrack, data=worldRecords,
       type=c("p","smooth"))



