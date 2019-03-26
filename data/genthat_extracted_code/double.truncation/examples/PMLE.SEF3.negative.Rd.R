library(double.truncation)


### Name: PMLE.SEF3.negative
### Title: Parametric Inference for the three-parameter SEF model (negative
###   parameter space for eta_3)
### Aliases: PMLE.SEF3.negative
### Keywords: Special exponential family Skew normal distribution

### ** Examples

## The first 10 samples of the childhood cancer data ##
y.trunc=c(6,7,15,43,85,92,96,104,108,123)
u.trunc=c(-1643,-24,-532,-1508,-691,-1235,-786,-261,-108,-120)
v.trunc=u.trunc+1825
PMLE.SEF3.negative(u.trunc,y.trunc,v.trunc)



