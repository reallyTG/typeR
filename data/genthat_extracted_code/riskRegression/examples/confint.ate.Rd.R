library(riskRegression)


### Name: confint.ate
### Title: Confidence Intervals and Confidence Bands for the Predicted
###   Absolute Risk (Cumulative Incidence Function)
### Aliases: confint.ate

### ** Examples

library(survival)

## ## generate data ####
set.seed(10)
d <- sampleData(70,outcome="survival")
d[, X1 := paste0("T",rbinom(.N, size = 2, prob = c(0.51)))]
## table(d$X1)

#### stratified Cox model ####
fit <- coxph(Surv(time,event)~X1 + strata(X2) + X6,
             data=d, ties="breslow", x = TRUE, y = TRUE)

#### average treatment effect ####
fit.pred <- ate(fit, treatment = "X1", times = 1:3, data = d,
                se = TRUE, iid = TRUE, band = TRUE)
print(fit.pred, type = "meanRisk")

## manual calculation of se
dd <- copy(d)
dd$X1 <- rep(factor("T0", levels = paste0("T",0:2)), NROW(dd))
out <- predictCox(fit, newdata = dd, se = TRUE, times = 1:3, average.iid = TRUE)
term1 <- -out$survival.average.iid
term2 <- sweep(1-out$survival, MARGIN = 2, FUN = "-", STATS = colMeans(1-out$survival))
sqrt(colSums((term1 + term2/NROW(d))^2)) 

## note
out2 <- predictCox(fit, newdata = dd, se = TRUE, times = 1:3, iid = TRUE)
mean(out2$survival.iid[,1,1])
out$survival.average.iid[1,1]

## check confidence intervals (no transformation)
fit.pred$meanRisk[, .(lower = meanRisk - 1.96 * meanRisk.se,
                      upper = meanRisk + 1.96 * meanRisk.se)]

## add confidence intervals computed on the log-log scale
## and backtransformed
outCI <- confint(fit.pred,
meanRisk.transform = "loglog", diffRisk.transform = "atanh", ratioRisk.transform = "log"
)
print(outCI, type = "meanRisk")

newse <- fit.pred$meanRisk[, meanRisk.se/(meanRisk*log(meanRisk))]
fit.pred$meanRisk[, .(lower = exp(-exp(log(-log(meanRisk)) - 1.96 * newse)),
                      upper = exp(-exp(log(-log(meanRisk)) + 1.96 * newse)))]



