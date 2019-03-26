library(depmixS4)


### Name: em.control
### Title: Control parameters for the EM algorithm
### Aliases: em.control
### Keywords: methods

### ** Examples

# using "hard" assignment of observations to the states, we can maximise the
# classification likelihood instead of the usual marginal likelihood
data(speed)  
mod <- depmix(list(rt~1,corr~1),data=speed,nstates=2,
    family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))
set.seed(1)
# fit the model by calling fit
fmod <- fit(mod,emcontrol=em.control(classification="hard"))
# can get rather different solutions with different starting values...
set.seed(3)
fmod2 <- fit(mod,emcontrol=em.control(classification="hard"))



