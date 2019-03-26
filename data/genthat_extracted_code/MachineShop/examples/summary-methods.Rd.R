library(MachineShop)


### Name: summary
### Title: Model Performance Summary
### Aliases: summary summary.Performance summary.Resamples
###   summary.MLModelTune summary.Confusion summary.ConfusionMatrix

### ** Examples

## Factor response example

fo <- Species ~ .
control <- CVControl()

gbmres1 <- resample(fo, iris, GBMModel(n.trees = 25), control)
gbmres2 <- resample(fo, iris, GBMModel(n.trees = 50), control)
gbmres3 <- resample(fo, iris, GBMModel(n.trees = 100), control)
summary(gbmres3)

res <- Resamples(GBM1 = gbmres1, GBM2 = gbmres2, GBM3 = gbmres3)
summary(res)




