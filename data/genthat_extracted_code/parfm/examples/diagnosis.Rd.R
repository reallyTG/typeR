library(parfm)


### Name: diagnosis
### Title: Diagnosis of fracture healing
### Aliases: diagnosis
### Keywords: datasets diagnosis fracture dogs RX radiography US ultrasound
###   frailty

### ** Examples

## No test: 
data(diagnosis)
head(diagnosis)

diagnosis$TimeMonths <- diagnosis$Time * 12 / 365.25

################################################################################
# Example 3.6: Shared gamma frailty models [...] for time to diagnosis         #
# of being healed                                                              #
# Duchateau and Janssen (2008, page 101)                                       #
################################################################################
WeiGam <- parfm(Surv(TimeMonths, Status) ~ Method,
                cluster = "Dogid", data = diagnosis,
                dist = "weibull", frailty = "gamma")
WeiGam

curve(WeiGam["lambda", 1] * WeiGam["rho", 1] * x ^ (WeiGam["rho", 1] - 1),
      from = 0, to = 4, ylim = c(0, 25), 
      ylab = "Hazard function", xlab = "Time (months)")
curve(exp(WeiGam["Method", 1]) *
      WeiGam["lambda", 1] * WeiGam["rho", 1] * x ^ (WeiGam["rho", 1] - 1),
      add = TRUE, lty = 2)
legend("topleft", lty = 1:2, legend = c("US", "RX"))
      
################################################################################
# Example 4.8: Inverse Gaussian frailty models [...] for time to diagnosis     #
# of being healed                                                              #
# Duchateau and Janssen (2008, page 160)                                       #
################################################################################
WeiIG <- parfm(Surv(TimeMonths, Status) ~ Method,
               cluster = "Dogid", data = diagnosis,
               dist = "weibull", frailty = "ingau")
WeiIG

curve(WeiIG["lambda", 1] * WeiIG["rho", 1] * x ^ (WeiIG["rho", 1] - 1),
      from = 0, to = 4, ylim = c(0, 25), 
      ylab = "Hazard function", xlab = "Time (months)")
curve(exp(WeiIG["Method", 1]) *
      WeiIG["lambda", 1] * WeiIG["rho", 1] * x ^ (WeiIG["rho", 1] - 1),
      add = TRUE, lty = 2)
legend("topleft", lty = 1:2, legend = c("US", "RX"))


################################################################################
# Example 4.11: Positive Stable frailty models [...] for time to diagnosis     #
# of being healed                                                              #
# Duchateau and Janssen (2008, page 172)                                       #
################################################################################
WeiPS <- parfm(Surv(TimeMonths, Status) ~ Method,
               cluster = "Dogid", data = diagnosis,
               dist = "weibull", frailty = "possta")
WeiPS

curve(WeiPS["lambda", 1] * WeiPS["rho", 1] * x ^ (WeiPS["rho", 1] - 1),
      from = 0, to = 4, ylim = c(0, 25), 
      ylab = "Hazard function", xlab = "Time (months)")
curve(exp(WeiPS["Method", 1]) *
      WeiPS["lambda", 1] * WeiPS["rho", 1] * x ^ (WeiPS["rho", 1] - 1),
      add = TRUE, lty = 2)
legend("topleft", lty = 1:2, legend = c("US", "RX"))
## End(No test)


