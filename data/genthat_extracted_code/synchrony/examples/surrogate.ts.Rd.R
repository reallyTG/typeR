library(synchrony)


### Name: surrogate.ts
### Title: Create surrogate time series via Markov process
### Aliases: surrogate.ts

### ** Examples

t1=runif(100)
surr.t1=surrogate.ts(ts=t1)
plot(t1, t="l")
lines(surr.t1$surr.ts, col="red")



