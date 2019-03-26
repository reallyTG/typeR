library(svyPVpack)


### Name: svyPVpm
### Title: Mean and proportion estimation
### Aliases: svyPVpm
### Keywords: Mean proportion

### ** Examples


data(svy_example1)

erg_pm <- svyPVpm(by = ~ sex, svydat=svy.exrep, pvs=c("plaus1","plaus2","plaus3"))

erg_pm




