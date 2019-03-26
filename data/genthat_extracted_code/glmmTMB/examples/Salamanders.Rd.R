library(glmmTMB)


### Name: Salamanders
### Title: Repeated counts of salamanders in streams
### Aliases: Salamanders
### Keywords: datasets

### ** Examples

require("glmmTMB")
data(Salamanders)
## No test: 
zipm3 = glmmTMB(count~spp * mined + (1|site), zi=~spp * mined, Salamanders, family="poisson")
## End(No test)



