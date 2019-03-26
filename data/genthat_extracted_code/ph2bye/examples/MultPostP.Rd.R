library(ph2bye)


### Name: MultPostP
### Title: The posterior probability criterion function for Phase II
###   single-arm design
### Aliases: MultPostP

### ** Examples

n <- 30; x.eff <- 5; x.tox <- 8; param <- c(1,1,1,1); p0.eff <- 0.9; p0.tox <- 0.95
MultPostP(x=x.eff, n=n, a.vec=param, p0=p0.eff)
MultPostP(x=x.tox, n=n, a.vec=param, p0=p0.tox)



