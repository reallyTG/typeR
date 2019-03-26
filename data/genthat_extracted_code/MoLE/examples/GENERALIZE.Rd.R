library(MoLE)


### Name: GENERALIZE
### Title: Apply linguistic generalizations
### Aliases: GENERALIZE
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
GENERALIZE(1, proposition, situation)
population[[1]]$wordOrder[3,2:3]=9999
population[[1]]$wordOrder
GENERALIZE(1, proposition, situation)



