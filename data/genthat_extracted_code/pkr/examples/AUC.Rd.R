library(pkr)


### Name: AUC
### Title: Calculate Area Under the Curve (AUC) and Area Under the first
###   Moment Curve (AUMC) in a table format
### Aliases: AUC
### Keywords: AUC

### ** Examples

AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"], down="Log")



