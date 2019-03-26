library(coin)


### Name: glioma
### Title: Malignant Glioma Pilot Study
### Aliases: glioma
### Keywords: datasets

### ** Examples

## Grade III glioma
g3 <- subset(glioma, histology == "Grade3")

## Plot Kaplan-Meier estimates
op <- par(no.readonly = TRUE) # save current settings
layout(matrix(1:2, ncol = 2))
plot(survfit(Surv(time, event) ~ group, data = g3),
     main = "Grade III Glioma", lty = 2:1,
     ylab = "Probability", xlab = "Survival Time in Month",
     xlim = c(-2, 72))
legend("bottomleft", lty = 2:1, c("Control", "Treated"), bty = "n")

## Exact logrank test
logrank_test(Surv(time, event) ~ group, data = g3,
             distribution = "exact")


## Grade IV glioma
gbm <- subset(glioma, histology == "GBM")

## Plot Kaplan-Meier estimates
plot(survfit(Surv(time, event) ~ group, data = gbm),
     main = "Grade IV Glioma", lty = 2:1,
     ylab = "Probability", xlab = "Survival Time in Month",
     xlim = c(-2, 72))
legend("topright", lty = 2:1, c("Control", "Treated"), bty = "n")
par(op) # reset

## Exact logrank test
logrank_test(Surv(time, event) ~ group, data = gbm,
             distribution = "exact")


## Stratified approximative (Monte Carlo) logrank test
logrank_test(Surv(time, event) ~ group | histology, data = glioma,
             distribution = approximate(B = 10000))



