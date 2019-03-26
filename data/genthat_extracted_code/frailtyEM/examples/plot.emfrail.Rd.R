library(frailtyEM)


### Name: plot.emfrail
### Title: Plots for emfrail objects
### Aliases: plot.emfrail

### ** Examples

mod_rec <- emfrail(Surv(start, stop, status) ~ treatment + number + cluster(id), bladder1,
control = emfrail_control(ca_test = FALSE, lik_ci = FALSE))

# Histogram of the estimated frailties
plot(mod_rec, type = "hist")

# hazard ratio between placebo and pyridoxine
newdata1 <- data.frame(treatment = c("placebo", "pyridoxine"),
                       number = c(1, 3))

plot(mod_rec, type = "hr", newdata = newdata1)

# predicted cumulative hazard for placebo, and number = 1
plot(mod_rec, type = "pred", newdata = newdata1[1,])

# predicted survival for placebo, and number = 1
plot(mod_rec, type = "pred", quantity = "survival", newdata = newdata1[1,])

# predicted survival for an individual that switches from
# placebo to pyridoxine at time = 15
newdata2 <- data.frame(treatment = c("placebo", "pyridoxine"),
                       number = c(1, 3),
                       tstart = c(0, 15),
                       tstop = c(15, Inf))

plot(mod_rec, type = "pred", quantity = "survival", newdata = newdata2, individual = TRUE)



