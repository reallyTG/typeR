library(reliaR)


### Name: GenExpsurvival
### Title: Survival related functions for the Generalized Exponential (GE)
###   distribution
### Aliases: GenExpsurvival crf.gen.exp hgen.exp hra.gen.exp sgen.exp
### Keywords: survival

### ** Examples

## load data set
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609
sgen.exp(bearings, 5.28321139, 0.03229609)
hgen.exp(bearings, 5.28321139, 0.03229609)
hra.gen.exp(bearings, 5.28321139, 0.03229609)
crf.gen.exp(bearings, 20.0, 5.28321139, 0.03229609)



