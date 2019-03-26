library(ergm)


### Name: g4
### Title: Goodreau's four node network as a "network" object
### Aliases: g4
### Keywords: datasets

### ** Examples


data(g4)
summary(ergm(g4 ~ odegree(3), estimate="MPLE"))
summary(ergm(g4 ~ odegree(3), control=control.ergm(init=0)))




