library(phenofit)


### Name: init_param
### Title: init_param
### Aliases: init_param

### ** Examples

library(phenofit)
# simulate vegetation time-series
fFUN = doubleLog.Beck
par  = c(
    mn  = 0.1,
    mx  = 0.7,
    sos = 50,
    rsp = 0.1,
    eos = 250,
    rau = 0.1)
t    <- seq(1, 365, 8)
tout <- seq(1, 365, 1)
y <- fFUN(par, t)

l_param <- init_param(y, t)



