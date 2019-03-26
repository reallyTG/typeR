library(actuar)


### Name: CTE
### Title: Conditional Tail Expectation
### Aliases: CTE TVaR CTE.aggregateDist
### Keywords: univar

### ** Examples

model.freq <- expression(data = rpois(7))
model.sev <- expression(data = rnorm(9, 2))
Fs <- aggregateDist("simulation", model.freq, model.sev, nb.simul = 1000)
CTE(Fs)



