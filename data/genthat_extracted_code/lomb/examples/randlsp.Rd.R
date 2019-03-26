library(lomb)


### Name: randlsp
### Title: Randomise Lomb-Scargle Periodogram
### Aliases: randlsp
### Keywords: ts

### ** Examples

data(lynx)
set.seed(444)
rand.times <- sample(1:length(lynx),30) # select a random vector of sampling times
randlsp(1000,lynx[rand.times],times=rand.times)



