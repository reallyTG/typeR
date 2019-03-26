library(secrlinear)


### Name: sim.linearpopn
### Title: Simulate Animals on Lines
### Aliases: sim.linearpopn
### Keywords: datagen

### ** Examples


x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
mask <- read.linearmask(data = xy, spacing = 10)
trps <- make.line(mask, n = 15, startbuffer = 1000, by = 30)

newmask <- clipmask(mask, trps, buffer = 200)

linpop <- sim.linearpopn(newmask, 200)
CH <- sim.capthist(trps, linpop, userdist = networkdistance)
plot(newmask)
plot(CH, add = TRUE)

secr.fit(CH, mask = mask, details = list(userdist = networkdistance))




