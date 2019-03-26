library(reliaR)


### Name: LFR
### Title: The linear failure rate(LFR) distribution
### Aliases: LFR dlfr plfr qlfr rlfr
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 1.77773e-03,  beta.est = 2.77764e-06

dlfr(sys2, 1.777673e-03, 2.777640e-06, log = FALSE)
plfr(sys2, 1.777673e-03, 2.777640e-06, lower.tail = TRUE, log.p = FALSE)
qlfr(0.25, 1.777673e-03, 2.777640e-06, lower.tail=TRUE, log.p = FALSE)
rlfr(30, 1.777673e-03, 2.777640e-06)



