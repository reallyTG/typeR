library(svyPVpack)


### Name: svyPVbenchmark
### Title: Estimate the proportion below and above a bechmark
### Aliases: svyPVbenchmark
### Keywords: benchmark

### ** Examples


data(svy_example1)

erg_ben <- svyPVbenchmark(by = ~ sex, svydat=svy.exrep, 
pvs=c("plaus1","plaus2","plaus3"), BENCH=320)

erg_ben






