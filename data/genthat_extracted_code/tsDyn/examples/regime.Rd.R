library(tsDyn)


### Name: regime
### Title: Extract variable showing regime
### Aliases: regime regime.default
### Keywords: ts

### ** Examples


set<-setar(lynx, m=3)
regime(set)
regime(set, time=FALSE, initVal=FALSE)

plot(regime(set))




