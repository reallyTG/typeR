library(svyPVpack)


### Name: svyPVpack-package
### Title: Use survey designs including plausible values
### Aliases: svyPVpack-package svyPVpack
### Keywords: package

### ** Examples



data(svy_example1)

erg_ben <- svyPVbenchmark(by = ~ sex, svydat=svy.exrep,
pvs=c("plaus1","plaus2","plaus3"), BENCH=320)

erg_ben





