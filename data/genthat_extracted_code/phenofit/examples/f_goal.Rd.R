library(phenofit)


### Name: f_goal
### Title: Goal function of fine curve fitting methods
### Aliases: f_goal

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

par0 <- c(
    mn  = 0.15,
    mx  = 0.65,
    sos = 100,
    rsp = 0.12,
    eos = 200,
    rau = 0.12)
f_goal(par0, y, t, fFUN)



