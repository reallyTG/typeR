library(dejaVu)


### Name: GetImputedDataSet
### Title: Output a single imputed data set
### Aliases: GetImputedDataSet

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
event.rates=c(0.01,0.005),dispersions=0.25)
sim.with.MCAR.dropout <- SimulateDropout(sim,
  drop.mechanism = ConstantRateDrop(rate = 0.0025))
fit <- Simfit(sim.with.MCAR.dropout)
imps <- Impute(fit, copy_reference(), 10)
imp1 <- GetImputedDataSet(imps, 1)




