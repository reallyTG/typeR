library(TraMineRextras)


### Name: TSE_to_STS
### Title: Converting TSE data into STS (state sequences) format.
### Aliases: TSE_to_STS
### Keywords: data format

### ** Examples

data(actcal.tse)
events <- c("PartTime", "NoActivity", "FullTime", "LowPartTime")
## Dropping all previous events.
stm <- seqe2stm(events, dropList=list(PartTime=events[-1],
   NoActivity=events[-2], FullTime=events[-3], LowPartTime=events[-4]))
mysts <- TSE_to_STS(actcal.tse[1:100,], id=1, timestamp=2, event=3,
   stm=stm, tmin=1, tmax=12, firstState="None")



