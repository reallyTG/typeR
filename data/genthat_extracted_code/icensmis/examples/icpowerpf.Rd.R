library(icensmis)


### Name: icpowerpf
### Title: Study design in the presence of interval censored outcomes
###   (assuming perfect diagnostic tests)
### Aliases: icpowerpf

### ** Examples

powpf1 <- icpowerpf(HR =2 , survivals = seq(0.9, 0.1, by=-0.1), N = NULL,
   power = 0.9, pmiss = 0)

powpf2 <- icpowerpf(HR =2 , survivals = seq(0.9, 0.1, by=-0.1), N = NULL,
   power = 0.9, pmiss = 0.7)

## Different missing probabilities at each test time
powpf3 <- icpowerpf(HR =2 , survivals = seq(0.9, 0.1, -0.1), N = NULL,
   power = 0.9, pmiss = seq(0.1, .9, 0.1))



