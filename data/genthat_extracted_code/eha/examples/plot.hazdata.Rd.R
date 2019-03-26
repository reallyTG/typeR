library(eha)


### Name: plot.hazdata
### Title: Plots of survivor functions.
### Aliases: plot.hazdata
### Keywords: survival

### ** Examples


time0 <- numeric(50)
group <- c(rep(0, 25), rep(1, 25))
time1 <- rexp( 50, exp(group) )
event <- rep(1, 50)
fit <- coxreg(Surv(time0, time1, event) ~ strata(group), hazards = TRUE)
plot(fit$hazards)




