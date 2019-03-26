library(gsynth)


### Name: interFE
### Title: Interactive Fixed Effects Models
### Aliases: interFE

### ** Examples

library(gsynth)
data(gsynth)
d <- simdata[-(1:150),] # remove the treated units
out <- interFE(Y ~ X1 + X2, data = d, index=c("id","time"),
               r = 2, force = "two-way", nboots = 50)



