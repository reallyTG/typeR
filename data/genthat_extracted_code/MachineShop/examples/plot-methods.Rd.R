library(MachineShop)


### Name: plot
### Title: Model Performance Plots
### Aliases: plot plot.Performance plot.Resamples plot.MLModelTune
###   plot.Calibration plot.Confusion plot.ConfusionMatrix plot.Lift
###   plot.PartialDependence plot.VarImp

### ** Examples

## Factor response example

fo <- Species ~ .
control <- CVControl()

gbmfit <- fit(fo, data = iris, model = GBMModel, control = control)
plot(varimp(gbmfit))

gbmres1 <- resample(fo, iris, GBMModel(n.trees = 25), control)
gbmres2 <- resample(fo, iris, GBMModel(n.trees = 50), control)
gbmres3 <- resample(fo, iris, GBMModel(n.trees = 100), control)
plot(gbmres3)

res <- Resamples(GBM1 = gbmres1, GBM2 = gbmres2, GBM3 = gbmres3)
plot(res)




