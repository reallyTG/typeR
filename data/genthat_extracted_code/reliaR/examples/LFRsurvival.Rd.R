library(reliaR)


### Name: LFRsurvival
### Title: Survival related functions for the linear failure rate(LFR)
###   distribution
### Aliases: LFRsurvival crf.lfr hlfr hra.lfr slfr
### Keywords: survival

### ** Examples

## load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 1.77773e-03,  beta.est = 2.77764e-06

## Reliability indicators for data(sys2):

## Reliability function
slfr(sys2, 1.777673e-03, 2.777640e-06)

## Hazard function
hlfr(sys2, 1.777673e-03, 2.777640e-06)

## hazard rate average(hra)
hra.lfr(sys2, 1.777673e-03, 2.777640e-06)

## Conditional reliability function (age component=0)
crf.lfr(sys2, 0.00, 1.777673e-03, 2.777640e-06)

## Conditional reliability function (age component=3.0)
crf.lfr(sys2, 3.0, 1.777673e-03, 2.777640e-06)



