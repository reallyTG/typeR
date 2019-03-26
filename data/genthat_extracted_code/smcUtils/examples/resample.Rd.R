library(smcUtils)


### Name: resample
### Title: Resample
### Aliases: resample
### Keywords: htest

### ** Examples

ws = dnorm(0:5, log=TRUE)
resample(ws)
resample(ws,13)
resample(ws,method="residual")
resample(ws,method="residual",rrf="stratified")
resample(ws,17,"stratified","ess",0.5)



