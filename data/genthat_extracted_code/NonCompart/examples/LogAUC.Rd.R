library(NonCompart)


### Name: LogAUC
### Title: Area Under the Curve(AUC) and Area Under the first Moment
###   Curve(AUMC) by linear-up log-down method
### Aliases: LogAUC
### Keywords: AUC

### ** Examples

LogAUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
# Compare the last line with the above
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"], down="Log") 



