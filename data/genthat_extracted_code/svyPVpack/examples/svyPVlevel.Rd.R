library(svyPVpack)


### Name: svyPVlevel
### Title: Proportion in levels estimation
### Aliases: svyPVlevel
### Keywords: level

### ** Examples


data(svy_example1)

erg_l <- svyPVlevel(by = ~ sex, svydat=svy.exrep, 
pvs=c("plaus1","plaus2","plaus3"), CATDEF=c(0,310,322,400))

erg_l





