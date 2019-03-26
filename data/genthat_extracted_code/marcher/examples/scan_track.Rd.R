library(marcher)


### Name: scan_track
### Title: scan_track
### Aliases: scan_track

### ** Examples


## Roe deer data

data(Michela)
par(bty="l", mar = c(0,4,0,2), oma=c(4,0,4,0), xpd=NA) 
with(Michela, scan_track(time = time, x = x, y = y, main="Michela"))

## Simulated track

time <- 1:200
Mean <- getMu(T = time, p.m = c(x1 = 0, y1 = 0, x2 = 10, y2 = 10, t1 = 90, dt = 20))
SimTrack <- simulate_shift(T = time, tau = c(tau.z = 5), mu = Mean, A = 40)
with(SimTrack, scan_track(time = T, x = X, y = Y))

# OR (because SimTrack is a "track")
scan_track(SimTrack)



