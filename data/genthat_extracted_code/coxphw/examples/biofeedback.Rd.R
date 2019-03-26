library(coxphw)


### Name: biofeedback
### Title: Biofeedback Treatment Data
### Aliases: biofeedback
### Keywords: datasets

### ** Examples

data("biofeedback")

plot(survfit(Surv(thdur, success) ~ bfb, data = biofeedback), lty = 1:2, las = 1,
     xlab = "time (days)", ylab = "propability of success")
     
coxphw(Surv(thdur, success) ~ bfb, data = biofeedback,  template = "AHR")     



