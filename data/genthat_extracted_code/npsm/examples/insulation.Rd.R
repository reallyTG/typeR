library(npsm)


### Name: insulation
### Title: Insulating Fluid Data
### Aliases: insulation
### Keywords: datasets

### ** Examples

myscores <- logGFscores
myscores@param <- c(1,5)
fit <- rfit(log.time ~ log.stress,scores=myscores,data=insulation)
summary(fit)
fit$tauhat



