library(growthrates)


### Name: ode_twostep
### Title: Twostep Growth Model
### Aliases: ode_twostep grow_twostep

### ** Examples


time <- seq(0, 30, length=200)
parms <- c(kw = 0.1,	mumax=0.2, K=0.1)
y0    <-  c(yi=0.01, ya=0.0)
out   <- ode(y0, time, ode_twostep, parms)

plot(out)

o <- grow_twostep(0:100, c(yi=0.01, ya=0.0, kw = 0.1,	mumax=0.2, K=0.1))
plot(o)




