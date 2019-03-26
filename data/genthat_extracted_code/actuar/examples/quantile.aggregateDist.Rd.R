library(actuar)


### Name: quantile.aggregateDist
### Title: Quantiles of Aggregate Claim Amount Distribution
### Aliases: quantile.aggregateDist VaR.aggregateDist
### Keywords: univar

### ** Examples

model.freq <- expression(data = rpois(3))
model.sev <- expression(data = rlnorm(10, 1.5))
Fs <- aggregateDist("simulation", model.freq, model.sev, nb.simul = 1000)
quantile(Fs, probs = c(0.25, 0.5, 0.75))
VaR(Fs)



