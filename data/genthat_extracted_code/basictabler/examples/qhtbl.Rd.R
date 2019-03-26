library(basictabler)


### Name: qhtbl
### Title: Quickly render a basic table in HTML.
### Aliases: qhtbl

### ** Examples

qhtbl(head(bhmsummary))
qhtbl(bhmsummary[1:5, c("GbttWeekDate", "Origin", "Destination", "TrainCount",
  "OnTimeArrivals")])
qhtbl(bhmsummary[1:5, c("GbttWeekDate", "Origin", "Destination", "TrainCount",
  "OnTimeArrivals")], columnNamesAsColumnHeaders=FALSE,
  explicitColumnHeaders=c("Week", "From", "To", "Trains", "On-Time"))




