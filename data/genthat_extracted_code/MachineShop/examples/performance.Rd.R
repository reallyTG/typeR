library(MachineShop)


### Name: performance
### Title: Model Performance Metrics
### Aliases: performance performance.Resamples performance.factor
###   performance.matrix performance.numeric performance.Surv modelmetrics

### ** Examples

res <- resample(Species ~ ., data = iris, model = GBMModel)
(perf <- performance(res))
summary(perf)
plot(perf)

## Survival response example
library(survival)
library(MASS)

fo <- Surv(time, status != 2) ~ sex + age + year + thickness + ulcer
gbmfit <- fit(fo, data = Melanoma, model = GBMModel)

obs <- response(fo, data = Melanoma)
pred <- predict(gbmfit, newdata = Melanoma, type = "prob")
performance(obs, pred)




