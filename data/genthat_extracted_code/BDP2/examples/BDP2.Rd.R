library(BDP2)


### Name: BDP2
### Title: Operating characteristics of a single-arm trial with a binary
###   endpoint
### Aliases: BDP2
### Keywords: design

### ** Examples

# Operating characteristics with calling for efficacy
BDP2(n=20, interim.at = c(3,9,13,18), ptrue = 0.3, 
      eff.stop = "call",
      pF=0.3, cF=0.01, pE=0.12, cE = 0.9, 
      type="PostProb", 
      shape1F=0.3, shape2F=0.7, shape1E=0.12, shape2E=0.88)

# Operating characteristics with stopping for efficacy
BDP2(n=20, interim.at = c(3,9,13,18), ptrue = 0.3, 
      eff.stop = "stop",
      pF=0.3, cF=0.01, pE=0.12, cE = 0.9, 
      type="PostProb", 
      shape1F=0.3, shape2F=0.7, shape1E=0.12, shape2E=0.88)






