library(MachineShop)


### Name: t.test
### Title: Paired t-Tests for Model Comparisons
### Aliases: t.test t.test.PerformanceDiff

### ** Examples

## Numeric response example
library(MASS)

fo <- medv ~ .
control <- CVControl()

gbmres1 <- resample(fo, Boston, GBMModel(n.trees = 25), control)
gbmres2 <- resample(fo, Boston, GBMModel(n.trees = 50), control)
gbmres3 <- resample(fo, Boston, GBMModel(n.trees = 100), control)

res <- Resamples(GBM1 = gbmres1, GBM2 = gbmres2, GBM3 = gbmres3)
perfdiff <- diff(res)
t.test(perfdiff)




