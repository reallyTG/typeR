library(marcher)


### Name: simulate_shift
### Title: Simulate MOUF process
### Aliases: simulate_shift

### ** Examples

require(marcher)

# 95% home range area
A <- 20
# distance of migration
D <- 100
# centers of attraction
x1 <- 0; y1 <- 0
x2 <- sqrt(D); y2 <- sqrt(D)
# time scales
tau.z <- 5
tau.v <- 0.5

t1 <- 90
dt <- 20

# mean parameters (t1,dt)
mus <- c(t1=t1,dt=dt,x1=x1,y1=y1,x2=x2,y2=y2)
# time-scale parameters
taus <- c(tau.z = tau.z, tau.v = tau.v)

# generate and plot mean vector
T <- 1:200
Mu <- getMu(T, mus)

# simulate and plot MOUF process
SimTrack <- simulate_shift(T, tau=taus, Mu, A=A)
with(SimTrack, scan_track(time=T,x=X,y=Y))



