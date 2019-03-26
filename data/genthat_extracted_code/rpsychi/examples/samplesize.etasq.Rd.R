library(rpsychi)


### Name: samplesize.etasq
### Title: Sample size estimation in the analysis of variance
### Aliases: samplesize.etasq
### Keywords: design htest

### ** Examples

##Cohen (1988) ex.8.10
f <- .25
samplesize.etasq(k=4, delta= f^2/(1+f^2), power=.80, sig.level=.05)



