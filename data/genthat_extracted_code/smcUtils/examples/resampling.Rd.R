library(smcUtils)


### Name: Unbiased resampling
### Title: Resampling functions
### Aliases: resampling multinomial.resample residual.resample
###   stratified.resample systematic.resample branching.resample
### Keywords: htest

### ** Examples

ws = renormalize(runif(10))
multinomial.resample(ws)
residual.resample(ws,rrf="stratified")          
stratified.resample(ws,15)
systematic.resample(ws)
branching.resample(ws)



