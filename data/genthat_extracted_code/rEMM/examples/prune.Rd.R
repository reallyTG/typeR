library(rEMM)


### Name: prune
### Title: Prune States and/or Transitions
### Aliases: prune prune,EMM-method rare_clusters rare_clusters,tNN-method
###   rare_transitions rare_transitions,TRACDS-method
### Keywords: manip

### ** Examples

data("EMMTraffic")

## For the example we use a very high learning rate
emm_l <- EMM(threshold=0.2, measure="eJaccard", lambda = 1)
build(emm_l, EMMTraffic)

## show state counts and transition counts
cluster_counts(emm_l)
transition_matrix(emm_l, type="counts")

## rare state/transitions
rare_clusters(emm_l, count_threshold=0.1)
rare_transitions(emm_l, count_threshold=0.1)

## remove all states with a threshold of 0.1
emm_lr <- prune(emm_l, count_threshold=0.1)

## compare graphs
op <- par(mfrow = c(1, 2), pty = "m")
plot(emm_l, main = "EMM with high learning rate")
plot(emm_lr, main = "Simplified EMM")
par(op)




