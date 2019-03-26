library(CarletonStats)


### Name: permTest
### Title: Permutation test
### Aliases: permTest permTest.default permTest.formula
### Keywords: permutation randomization resampling test

### ** Examples


permTest(states03$ViolentCrime, states03$DeathPenalty)

#using formula syntax
permTest(ViolentCrime ~ DeathPenalty, data = states03, alt = "less")




