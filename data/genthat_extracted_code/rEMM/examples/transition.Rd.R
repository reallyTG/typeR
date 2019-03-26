library(rEMM)


### Name: transition
### Title: Access Transition Probabilities/Counts in an EMM
### Aliases: transition transition,TRACDS,character,character-method
###   transition,TRACDS,matrix,missing-method
###   transition,TRACDS,data.frame,missing-method transition_matrix
###   transition_matrix,TRACDS-method initial_transition
###   initial_transition,TRACDS-method
### Keywords: models

### ** Examples

data("EMMTraffic")
emm <- EMM(measure="eJaccard", threshold=0.2)
emm <- build(emm, EMMTraffic)

## get transition matrix
transition_matrix(emm, type="count", prior=FALSE)
transition_matrix(emm, type="count")
transition_matrix(emm, prior=FALSE)
transition_matrix(emm)

## get initial state probabilities
initial_transition(emm)

## access individual transition probability (state 1 -> 2)
transition(emm, "1","2")

## get counts for all existing transitions
tr <- transitions(emm)
tr
cbind(as.data.frame(tr), counts=transition(emm, tr, type="counts"))



