library(climbeR)


### Name: getAndPlotMetric
### Title: Calculate the metric and make Second Order vs First Order plot
### Aliases: getAndPlotMetric

### ** Examples

require(survival)
library(ranger)
rg.veteran <- ranger(Surv(time, status) ~ ., data = veteran, write.forest =
TRUE)
result <- getAndPlotMetric(rg.veteran)



