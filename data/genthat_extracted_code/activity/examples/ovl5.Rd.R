library(activity)


### Name: ovl5
### Title: Index of overlap between circular distributions.
### Aliases: ovl5

### ** Examples

data(BCItime)
oceAct <- fitact(subset(BCItime, species=="ocelot")$time*2*pi)
broAct <- fitact(subset(BCItime, species=="brocket")$time*2*pi)
ovl5(oceAct, broAct)



