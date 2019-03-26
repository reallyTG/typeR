library(stepR)


### Name: jsmurf
### Title: Reconstruct filtered piecewise constant functions with noise
### Aliases: jsmurf
### Keywords: nonparametric

### ** Examples

# simulate filtered ion channel recording with two states
set.seed(9)
# sampling rate 10 kHz
sampling <- 1e4
# tenfold oversampling
over <- 10
# 1 kHz 4-pole Bessel-filter, adjusted for oversampling
cutoff <- 1e3
df.over <- dfilter("bessel", list(pole=4, cutoff=cutoff / sampling / over))
# two states, leaving state 1 at 10 Hz, state 2 at 20 Hz
rates <- rbind(c(0, 10), c(20, 0))
# simulate 0.5 s, level 0 corresponds to state 1, level 1 to state 2
# noise level is 0.3 after filtering
sim <- contMC(0.5 * sampling, 0:1, rates, sampling=sampling, family="gaussKern",
  param = list(df=df.over, over=over, sd=0.3))
plot(sim$data, pch = ".")
lines(sim$discr, col = "red")
# fit using filter corresponding to sample rate
df <- dfilter("bessel", list(pole=4, cutoff=cutoff / sampling))
fit <- jsmurf(sim$data$y, sim$data$x, param=df, r=1e2)
lines(fit, col = "blue")
# fitted values take filter into account
lines(sim$data$x, fitted(fit), col = "green3", lty = 2)



