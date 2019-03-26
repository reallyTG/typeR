library(coxphw)


### Name: gastric
### Title: Gastric Cancer Data
### Aliases: gastric
### Keywords: datasets

### ** Examples

data("gastric")
plot(survfit(Surv(time, status) ~ radiation, data = gastric), lty = 1:2, las = 1,
     xscale = 365.25, xlab = "time (years)", ylab = "survival distribution function")

coxphw(Surv(time, status) ~ radiation, data = gastric, template = "AHR")



