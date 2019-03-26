library(NonCompart)


### Name: DetSlope
### Title: Determine slope for the log(y) and x regression manually
### Aliases: DetSlope
### Keywords: slope

### ** Examples

DetSlope(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
DetSlope(Indometh[Indometh$Subject==2, "time"], Indometh[Indometh$Subject==2, "conc"])



