library(dclone)


### Name: mcmcapply
### Title: Calculations on 'mcmc.list' objects
### Aliases: mcmcapply stack.mcmc.list
### Keywords: utilities

### ** Examples

data(regmod)
mcmcapply(regmod, mean)
mcmcapply(regmod, sd)

x <- stack(regmod)
head(x)
summary(x)
library(lattice)
xyplot(value ~ iter | variable, data=x,
    type="l", scales = "free", groups=chain)



