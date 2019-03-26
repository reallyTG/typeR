library(rEMM)


### Name: remove
### Title: Remove States/Clusters or Transitions from an EMM
### Aliases: remove_clusters remove_clusters,EMM,character-method
###   remove_transitions remove_transitions,EMM,character,character-method
###   remove_transitions,EMM,matrix,missing-method remove_selftransitions
###   remove_selftransitions,EMM-method
### Keywords: manip

### ** Examples

data("EMMTraffic")
emm <- EMM(measure="eJaccard", threshold=0.2)
emm <- build(emm, EMMTraffic)

## remove state 3
emm_rs3 <- remove_clusters(emm, "3")

## remove transition 5->2
emm_rt52 <- remove_transitions(emm, "5", "2")

## compare EMMs
op <- par(mfrow = c(2, 2), pty = "m")
plot(emm, method = "graph", main = "original EMM")
plot(emm_rs3, method = "graph", main = "state 3 removed")
plot(emm_rt52, method = "graph", main = "transition 5->2 removed")
par(op)



