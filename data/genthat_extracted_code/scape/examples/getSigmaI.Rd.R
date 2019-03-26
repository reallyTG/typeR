library(scape)


### Name: getSigmaI
### Title: Extract Abundance Index Sigma
### Aliases: getSigmaI

### ** Examples

## Exploring candidate sigmas:

getSigmaI(x.cod)  # sigma used in assessment 0.20
estSigmaI(x.cod)  # model fit implies 0.17

## Multiple series:

getSigmaI(x.oreo, "c")                 # sigma used in assessment
getSigmaI(x.oreo, "c", digits=2)       # rounded
estSigmaI(x.oreo, "c")                 # model fit implies smaller sigma

getSigmaI(x.oreo, "c", series="Series 2-1")  # get one series
estSigmaI(x.oreo, "c", series="Series 2-1")  # estimate one series



