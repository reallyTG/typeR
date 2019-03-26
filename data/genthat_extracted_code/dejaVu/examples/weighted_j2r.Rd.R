library(dejaVu)


### Name: weighted_j2r
### Title: Create a weighted_j2r 'ImputeMechanism' object
### Aliases: weighted_j2r

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
event.rates=c(0.01,0.005),dispersions=0.25)
sim.with.MCAR.dropout <- SimulateDropout(sim,
                     drop.mechanism = ConstantRateDrop(rate = 0.0025))
fit <- Simfit(sim.with.MCAR.dropout)
imps <- Impute(fit, weighted_j2r(trt.weight=0), 10)




