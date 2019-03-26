library(coxphw)


### Name: plot.coxphw
### Title: Plot Weights of Weighted Estimation in Cox Regression
### Aliases: plot.coxphw
### Keywords: survival

### ** Examples

data("gastric")

# weighted estimation of average hazard ratio
fit1 <- coxphw(Surv(time, status) ~ radiation, data = gastric,  template = "AHR")
plot(fit1)

# estimation of average regression effect by inverse probability of censoring weights;
# truncate weights at 95th percentile
fit2 <- coxphw(Surv(time, status) ~ radiation, data = gastric, template = "ARE",
               trunc.weights = 0.95)
plot(fit2)



