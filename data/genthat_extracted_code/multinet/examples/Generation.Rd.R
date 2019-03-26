library(multinet)


### Name: Getting networks: generation
### Title: Generation of multilayer networks
### Aliases: 'Getting networks: generation' grow.ml evolution.pa.ml
###   evolution.er.ml

### ** Examples

# we generate a network with two layers, one growing according
# to the Preferential Attachment model and one growing by selecting
# new edges uniformly at random.
models <- c(evolution.pa.ml(3,1), evolution.er.ml(50))
# all the probability vectors must have the same number of
# fields, one for each layer: two in this example
# by defining pr.internal and pr.external, we are also implicitely defining
# pr.no.action (1 minus the other probabilities, for each field/layer).
pr.external <- c(.5,0)
pr.internal <- c(.5,.5)
# each layer will import edges from the other if needed
# (not the second layer in this example: it has 0 probability of external events)
dependency <- matrix(c(0,1,1,0),2,2)
# 100 steps of network growing, adding actors from a pool of 100
grow.ml(100, 100, models, pr.internal, pr.external, dependency)



