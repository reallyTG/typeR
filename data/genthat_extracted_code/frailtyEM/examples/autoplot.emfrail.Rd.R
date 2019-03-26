library(frailtyEM)


### Name: autoplot.emfrail
### Title: Plots for emfrail objects using 'ggplot2'
### Aliases: autoplot.emfrail

### ** Examples

mod_rec <- emfrail(Surv(start, stop, status) ~ treatment + number + cluster(id), bladder1,
control = emfrail_control(ca_test = FALSE, lik_ci = FALSE))

# Histogram of the estimated frailties
autoplot(mod_rec, type = "hist")

# Ordered estimated frailties (with confidence intervals, for gamma distribution)
autoplot(mod_rec, type = "frail")

# hazard ratio between placebo and pyridoxine
newdata1 <- data.frame(treatment = c("placebo", "pyridoxine"),
                       number = c(1, 3))

autoplot(mod_rec, type = "hr", newdata = newdata1)

# predicted cumulative hazard for placebo, and number = 1
autoplot(mod_rec, type = "pred", newdata = newdata1[1,])

# predicted survival for placebo, and number = 1
autoplot(mod_rec, type = "pred", quantity = "survival", newdata = newdata1[1,])

# predicted survival for an individual that switches from
# placebo to pyridoxine at time = 15
## Not run: 
##D newdata2 <- data.frame(treatment = c("placebo", "pyridoxine"),
##D                        number = c(1, 3),
##D                        tstart = c(0, 15),
##D                        tstop = c(15, Inf))
##D 
##D autoplot(mod_rec, type = "pred", quantity = "survival", newdata = newdata2, individual = TRUE)
## End(Not run)



