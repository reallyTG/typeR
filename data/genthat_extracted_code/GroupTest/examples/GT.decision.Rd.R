library(GroupTest)


### Name: GT.decision
### Title: Between- and within-group decisions
### Aliases: GT.decision
### Keywords: Decision

### ** Examples


data(GroupTest_simulate)
GroupTest_simulate <- GT.localfdr( GroupTest_simulate, L=2, pi1=0.5, pi2.1=0.5,
muL=c(-1, 1), sigmaL=c(1,2), cL=c(0.4,0.6) )

GroupTest.decision <- GT.decision(GroupTest_simulate, alpha=0.05)



