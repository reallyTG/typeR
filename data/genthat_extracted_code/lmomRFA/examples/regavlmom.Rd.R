library(lmomRFA)


### Name: regavlmom
### Title: Regional weighted average of L-moments
### Aliases: regavlmom
### Keywords: misc

### ** Examples

reglm <- regsamlmu(Maxwind)
regavlmom(reglm)            # Weight proportional to record length
regavlmom(reglm, weight=1)  # Equal weights



