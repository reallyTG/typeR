library(basictabler)


### Name: qtbl
### Title: Quickly build a basic table.
### Aliases: qtbl

### ** Examples

qtbl(head(bhmsummary))
qtbl(bhmsummary[1:5, c("GbttWeekDate", "Origin", "Destination", "TrainCount",
  "OnTimeArrivals")])
qtbl(bhmsummary[1:5, c("GbttWeekDate", "Origin", "Destination", "TrainCount",
  "OnTimeArrivals")], columnNamesAsColumnHeaders=FALSE,
  explicitColumnHeaders=c("Week", "From", "To", "Trains", "On-Time"))




