library(PBSmapping)


### Name: combineEvents
### Title: Combine Measurements of Events
### Aliases: combineEvents
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- create an EventData data frame: let each event have Z = 1
  events <- data.frame(EID=1:10, X=1:10, Y=1:10, Z=rep(1, 10))
  #--- example output from findPolys where 1 event occurred in the first
  #--- polygon, 3 in the second, and 6 in the third
  locs <- data.frame(EID=1:10,PID=c(rep(1,1),rep(2,3),rep(3,6)),Bdry=rep(0,10))
  #--- sum the Z column of the events in each polygon, and print the result
  print(combineEvents(events=events, locs=locs, FUN=sum))
})



