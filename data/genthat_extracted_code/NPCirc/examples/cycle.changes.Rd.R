library(NPCirc)


### Name: cycle.changes
### Title: Cycle changes
### Aliases: cycle.changes
### Keywords: datasets

### ** Examples

data(cycle.changes)
thaw <- (cycle.changes[,1]==1)
frosting <- (cycle.changes[,1]==-1)
plot(circular(cycle.changes[frosting,2],template="clock24"), shrink=1.08, col=4, 
stack=TRUE, main="Frosting")
plot(circular(cycle.changes[thaw,2],template="clock24"), shrink=1.08, col=2, 
stack=TRUE, main="Thaw")



