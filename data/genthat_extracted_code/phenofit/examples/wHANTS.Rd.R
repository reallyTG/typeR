library(phenofit)


### Name: wHANTS
### Title: Weighted HANTS SMOOTH
### Aliases: wHANTS

### ** Examples

library(phenofit)
data("MOD13A1")
dt <- tidy_MOD13.gee(MOD13A1$dt)
d <- dt[site == "AT-Neu", ]

l <- check_input(d$t, d$y, d$w, nptperyear=23)
r_wHANTS <- wHANTS(l$y, l$t, l$w, ylu = l$ylu, nptperyear = 23, iters = 2)



