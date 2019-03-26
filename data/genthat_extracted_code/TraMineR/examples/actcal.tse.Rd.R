library(TraMineR)


### Name: actcal.tse
### Title: Example data set: Activity calendar from the Swiss Household
###   Panel (time stamped event format)
### Aliases: actcal.tse
### Keywords: Datasets

### ** Examples

data(actcal)
actcal.seq <- seqdef(actcal[,13:24])

## Defining the transition matrix
transition <- seqetm(actcal.seq, method="transition")
transition[1,1:4] <- c("FullTime"         , "Decrease,PartTime",
     "Decrease,LowPartTime", "Stop")
transition[2,1:4] <- c("Increase,FullTime", "PartTime"         ,
     "Decrease,LowPartTime", "Stop")
transition[3,1:4] <- c("Increase,FullTime", "Increase,PartTime",
    "LowPartTime"         , "Stop")
transition[4,1:4] <- c("Start,FullTime"   , "Start,PartTime"   ,
    "Start,LowPartTime"   , "NoActivity")
transition

## Converting STS data to TSE
actcal.tse <- seqformat(actcal, 13:24, from = "STS",to = "TSE",
  tevent = transition)

## Defining the event sequence object
actcal.eseq <- seqecreate(id=actcal.tse$id,
	time=actcal.tse$time, event=actcal.tse$event)



