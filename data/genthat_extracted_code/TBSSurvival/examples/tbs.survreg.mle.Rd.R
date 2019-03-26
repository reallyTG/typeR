library(TBSSurvival)


### Name: tbs.survreg.mle
### Title: MLE of the TBS Model for Failure Data
### Aliases: tbs.survreg.mle

### ** Examples

# Alloy - T7987: data extracted from Meeker and Escobar (1998), pp. 131.
data(alloyT7987)
alloyT7987$time <- as.double(alloyT7987$time)
alloyT7987$delta <- as.double(alloyT7987$delta)

# MLE estimation with logistic error
formula <- survival::Surv(alloyT7987$time,alloyT7987$delta == 1) ~ 1
tbs.mle <- tbs.survreg.mle(formula,dist=dist.error("logistic"),method="Nelder-Mead",nstart=3)

# Kaplan-Meier estimation
km <- survival::survfit(formula)

# Plot survival function
plot(tbs.mle)
lines(km)

# Plot hazard function
plot(tbs.mle, plot.type="hazard")




