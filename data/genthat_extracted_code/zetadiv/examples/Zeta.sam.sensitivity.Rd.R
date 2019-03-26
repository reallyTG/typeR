library(zetadiv)


### Name: Zeta.sam.sensitivity
### Title: Sensitivity analysis for the sample size of zeta
### Aliases: Zeta.sam.sensitivity

### ** Examples

## No test: 
#Note that the sensitivity analyses in the following two examples are quite long to run,
#typically around 10 minutes for the first example and 1-2 minutes for the second.

utils::data(bird.spec.coarse)
xy.bird <- bird.spec.coarse[1:2]
data.spec.bird <- bird.spec.coarse[3:193]

dev.new()
zeta.sens.bird <- Zeta.sam.sensitivity(data.spec.bird, order = 3,
    sam.seq = seq(250,1000,250), reps = 20, display = TRUE, plot = TRUE, notch = TRUE)
zeta.sens.bird

##########

utils::data(Marion.species)
xy.marion <- Marion.species[1:2]
data.spec.marion <- Marion.species[3:33]

dev.new()
zeta.sens.marion <- Zeta.sam.sensitivity(data.spec.marion, order = 3,
    sam.seq = seq(250,1000,250), reps = 20, plot = TRUE, notch = TRUE)
zeta.sens.marion
## End(No test)




