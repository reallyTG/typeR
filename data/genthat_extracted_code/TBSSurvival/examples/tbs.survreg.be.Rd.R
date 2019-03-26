library(TBSSurvival)


### Name: tbs.survreg.be
### Title: Bayesian Estimation of the TBS Model for Survival Data
### Aliases: tbs.survreg.be

### ** Examples

# set.seed is used to produce the same results all times.
set.seed(1234)

# Alloy - T7987: data extracted from Meeker and Escobar (1998), pp. 131)
data(alloyT7987)
alloyT7987$time  <- as.double(alloyT7987$time)
alloyT7987$delta <- as.double(alloyT7987$delta)

# Bayesian estimation with logistic error
formula <- survival::Surv(alloyT7987$time,alloyT7987$delta == 1) ~ 1
tbs.be <- tbs.survreg.be(formula,guess.lambda=1,guess.xi=1,guess.beta=5,
                         dist=dist.error("logistic"),burn=1000,jump=10,size=500,scale=0.06)

# Kapan-Meier estimator
km <- survival::survfit(formula = survival::Surv(alloyT7987$time, alloyT7987$delta == 1) ~ 1)

# Plot survival function
plot(tbs.be,lwd=2,HPD=TRUE,HPD.alpha=0.95,col.HPD=2,lty.HPD=1,lwd.HPD=2)
lines(km)

# Plot survival function
plot(tbs.be,plot.type="hazard",lwd=2,HPD=TRUE,HPD.alpha=0.95,col.HPD=2,lty.HPD=1,lwd.HPD=2)

# Plot auto-correlation of the posterior sample
plot(tbs.be,plot.type="auto")

# Plot "time-series" of the posterior sample
plot(tbs.be,plot.type="ts")



