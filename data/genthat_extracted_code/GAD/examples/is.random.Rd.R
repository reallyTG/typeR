library(GAD)


### Name: is.random
### Title: Tests if a factor is ramdom
### Aliases: is.random
### Keywords: design

### ** Examples

library(GAD)
data(rohlf95)
CG <- as.fixed(rohlf95$cages)
MQ <- as.random(rohlf95$mosquito) 
is.fixed(CG)
is.random(MQ)



