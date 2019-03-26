library(svyPVpack)


### Name: svyPVquantile
### Title: Quantile estimation
### Aliases: svyPVquantile
### Keywords: quantile

### ** Examples

data(svy_example1)

erg_q <- svyPVquantile(by = ~ sex, svydat=svy.exrep,
pvs=c("plaus1","plaus2","plaus3"), quantile=c(0.2,0.7))

erg_q



