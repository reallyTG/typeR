library(pkr)


### Name: LinAUC
### Title: Area Under the Curve(AUC) and Area Under the first Moment
###   Curve(AUMC) by linear trapezoidal method
### Aliases: LinAUC
### Keywords: AUC

### ** Examples

LinAUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"])
AUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"]) # compare the last line



