library(scape)


### Name: estSigmaI
### Title: Estimate Abundance Index Sigma
### Aliases: estSigmaI

### ** Examples

## Exploring candidate sigmas:

getSigmaI(x.cod)       # sigma used in assessment 0.20
estSigmaI(x.cod)       # model fit implies 0.17
plotIndex(x.cod)       # model fit
estSigmaI(x.cod, p=8)  # eight estimated parameters implies 0.22

getSigmaI(x.sbw)          # sigma used in assessment
estSigmaI(x.sbw)          # model fit implies smaller sigma
estSigmaI(x.sbw, init=1)  # could use 0.17 in all years

## Same mean, regardless of init:

mean(estSigmaI(x.sbw, digits=NULL))
mean(estSigmaI(x.sbw, digits=NULL, init=1))

## Same median, regardless of init:

median(estSigmaI(x.sbw, FUN=median, digits=NULL))
median(estSigmaI(x.sbw, FUN=median, digits=NULL, init=1))

## Multiple series:

getSigmaI(x.oreo, "c")                 # sigma used in assessment
getSigmaI(x.oreo, "c", digits=2)       # rounded
estSigmaI(x.oreo, "c")                 # model fit implies smaller sigma
estSigmaI(x.oreo, "c", init=1)         # could use 0.19 in all years
estSigmaI(x.oreo, "c", init=1, digits=3)  # series 2 slightly worse fit
# estSigmaI(x.oreo, "c", init=1, p=11) # more parameters than datapoints

getSigmaI(x.oreo, "c", series="Series 2-1")  # get one series
estSigmaI(x.oreo, "c", series="Series 2-1")  # estimate one series



