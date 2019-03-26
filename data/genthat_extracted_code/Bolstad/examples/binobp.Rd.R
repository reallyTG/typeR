library(Bolstad)


### Name: binobp
### Title: Binomial sampling with a beta prior
### Aliases: binobp
### Keywords: misc

### ** Examples


## simplest call with 6 successes observed in 8 trials and a beta(1,1) uniform
## prior
binobp(6,8)

## 6 successes observed in 8 trials and a non-uniform beta(0.5,6) prior
binobp(6,8,0.5,6)

## 4 successes observed in 12 trials with a non uniform beta(3,3) prior
## plot the stored prior, likelihood and posterior
results = binobp(4, 12, 3, 3)
decomp(results)





