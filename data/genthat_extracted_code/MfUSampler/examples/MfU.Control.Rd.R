library(MfUSampler)


### Name: MfU.Control
### Title: Constructing Control List for MfU.Sample
### Aliases: MfU.Control

### ** Examples


# default control a for 10-dimensional space
mycontrol <- MfU.Control(10)
# setting a lower bound of 0 for last coordinate
mycontrol <- MfU.Control(10, slice.lower=c(rep(-Inf,9),0.0))




