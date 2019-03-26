library(NonCompart)


### Name: BestSlope
### Title: Choose the best-fit slope for the log(y) and x regression by the
###   criteria of adjusted R-square.
### Aliases: BestSlope
### Keywords: slope

### ** Examples

BestSlope(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
BestSlope(Indometh[Indometh$Subject==1, "time"], Indometh[Indometh$Subject==1, "conc"],
          adm="Bolus")



