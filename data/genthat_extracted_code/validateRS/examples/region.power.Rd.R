library(validateRS)


### Name: region.power
### Title: Compute the power for a region and a given simple alternative
###   hypothesis.
### Aliases: region.power

### ** Examples

mp<-region.acceptance(hypo.test="minP", p.0=c(0.001, 0.004), size=c(1000, 1000), alpha=0.5)
region.power(mp, p.1=c(0.001, 0.01))



