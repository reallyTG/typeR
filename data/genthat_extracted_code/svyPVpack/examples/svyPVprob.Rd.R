library(svyPVpack)


### Name: svyPVprob
### Title: Proportion estimation
### Aliases: svyPVprob
### Keywords: proportion

### ** Examples


data(svy_example1)

erg_p <- svyPVprob(by = ~ sex, svydat=svy.exrep, pvs=c("plaus1","plaus2","plaus3"))

erg_p




