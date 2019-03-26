library(FlowScreen)


### Name: dr.events
### Title: Partial Duration Series and Event Statistics for streamflow
###   droughts
### Aliases: dr.events

### ** Examples

data(cania.sub.ts)
res1 <- dr.events(cania.sub.ts)
events <- res1$DroughtEvents
plot(events$Start, events$Duration, pch=19, ylab="Drought Duration (days)", xlab="")



