library(stepR)


### Name: contMC
### Title: Continuous time Markov chain
### Aliases: contMC
### Keywords: nonparametric

### ** Examples

# Simulate filtered ion channel recording with two states
set.seed(9)
# sampling rate 10 kHz
sampling <- 1e4
# tenfold oversampling
over <- 10
# 1 kHz 4-pole Bessel-filter, adjusted for oversampling
cutoff <- 1e3
df <- dfilter("bessel", list(pole=4, cutoff=cutoff / sampling / over))
# two states, leaving state 1 at 1 Hz, state 2 at 10 Hz
rates <- rbind(c(0, 1e0), c(1e1, 0))
# simulate 5 s, level 0 corresponds to state 1, level 1 to state 2
# noise level is 0.1 after filtering
sim <- contMC(5 * sampling, 0:1, rates, sampling=sampling, family="gaussKern",
  param = list(df=df, over=over, sd=0.1))
sim$cont
plot(sim$data, pch = ".")
lines(sim$discr, col = "red")
# noise level after filtering, estimated from first block
sd(sim$data$y[1:sim$discr$rightIndex[1]])
# show autocovariance in first block
acf(ts(sim$data$y[1:sim$discr$rightIndex[1]], freq=sampling), type = "cov")
# power spectrum in first block
s <- spec.pgram(ts(sim$data$y[1:sim$discr$rightIndex[1]], freq=sampling), spans=c(200,90))
# cutoff frequency is where power spectrum is halved
abline(v=cutoff, h=s$spec[1] / 2, lty = 2)



