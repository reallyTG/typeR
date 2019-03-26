library(phenofit)


### Name: wSG
### Title: Weighted Savitzky-Golay
### Aliases: wSG

### ** Examples

library(phenofit)
data("MOD13A1")
dt <- tidy_MOD13.gee(MOD13A1$dt)
d <- dt[site == "AT-Neu", ]

l <- check_input(d$t, d$y, d$w, nptperyear=23)
r_wSG <- wSG(l$y, l$w, l$ylu, nptperyear = 23, iters = 2)



