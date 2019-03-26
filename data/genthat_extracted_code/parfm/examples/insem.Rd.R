library(parfm)


### Name: insem
### Title: Time to first insemination in dairy heifer cows without time
###   varying covariates
### Aliases: insem
### Keywords: datasets insem cows insemination frailty

### ** Examples

## No test: 
data(insem)
head(insem)

insem$TimeMonths <- insem$Time * 12 / 365.25

################################################################################
#Example 2.1: The parametric proportional hazards frailty model for the time   #
#to first insemination based on marginal likelihood maximisation               #
#Duchateau and Janssen (2008, page 50)                                         #
################################################################################
pfm <- parfm(Surv(TimeMonths, Status) ~ Heifer, cluster = "Herd", data = insem,
             dist = "weibull", frailty = "gamma")
pfm

par(mfrow = c(2, 2))

### - Hazard functions - ###
# multiparous cows
curve((365.25 / 12) ^ (-pfm["rho", 1]) *
          pfm["lambda", 1] * pfm["rho", 1] * x ^ (pfm["rho", 1] - 1),
      from = 0, to = 400, ylim = c(0, .14), 
      main = "Multiparous cows",
      ylab = "Hazard function", xlab = "Time to first insemination (days)")
curve(qgamma(.95, shape = 1 / pfm["theta", 1],
             scale = pfm["theta", 1]) * (365.25 / 12) ^ (-pfm["rho", 1]) *
          pfm["lambda", 1] * pfm["rho", 1] * x ^ (pfm["rho", 1] - 1),
      add = TRUE, lty = 4)
curve(qgamma(.05, shape = 1 / pfm["theta", 1], 
             scale = pfm["theta", 1]) * (365.25 / 12) ^ (-pfm["rho", 1]) *
          pfm["lambda", 1] * pfm["rho", 1] * x ^ (pfm["rho", 1] - 1),
      add = TRUE, lty = 4)

# primiparous cows
curve(exp(pfm["Heifer", 1]) * (365.25 / 12)^(-pfm["rho", 1]) *
          pfm["lambda", 1] * pfm["rho", 1] * x^(pfm["rho", 1] - 1),
      from = 0, to = 400, ylim = c(0, .14), 
      main = "Primiparous cows", 
      ylab = "Hazard function", xlab = "Time to first insemination (days)")
curve(qgamma(.95, shape = 1 / pfm["theta", 1],
             scale = pfm["theta", 1]) * exp(pfm["Heifer", 1]) * 
          (365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1] * pfm["rho", 1] * 
          x ^ (pfm["rho", 1] - 1),
      add = TRUE, lty = 4)
curve(qgamma(.05, shape = 1 / pfm["theta", 1], 
             scale = pfm["theta", 1]) * exp(pfm["Heifer", 1]) * 
          (365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1] * pfm["rho", 1] *
          x ^ (pfm["rho", 1] - 1),
      add = TRUE, lty = 4)


### - Cumulative distribution functions - ###
# multiparous cows
curve(1 - exp(
    -(365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1] * 
        x ^ (pfm["rho", 1])),
    from = 0, to = 400, ylim = c(0, 1), 
    main = "Multiparous cows", 
    ylab = "Cumulative distribution function", 
    xlab = "Time to first insemination (days)")
curve(1 - exp(
    -qgamma(.95, shape = 1 / pfm["theta", 1],
            scale = pfm["theta", 1]) * (365.25 / 12) ^ (-pfm["rho", 1]) *
        pfm["lambda", 1] * x ^ (pfm["rho", 1])),
    add = TRUE, lty = 4)
curve(1 - exp(
    -qgamma(.05, shape = 1 / pfm["theta", 1],
            scale = pfm["theta", 1]) * (365.25 / 12) ^ (-pfm["rho", 1]) *
        pfm["lambda", 1] * x ^ (pfm["rho", 1])),
    add = TRUE, lty = 4)

# primiparous cows
curve(1 - exp(
    -exp(pfm["Heifer", 1]) *  (365.25 / 12) ^ (-pfm["rho", 1]) *
        pfm["lambda", 1] * x ^ (pfm["rho", 1])),
    from = 0, to = 400, ylim = c(0, 1), 
    main = "Primiparous cows", 
    ylab = "Cumulative distribution function", 
    xlab = "Time to first insemination (days)")
curve(1 - exp(
    -qgamma(.95, shape = 1 / pfm["theta", 1],
            scale = pfm["theta", 1]) * exp(pfm["Heifer", 1]) * 
        (365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1] * x ^ (pfm["rho", 1])),
    add = TRUE, lty = 4)
curve(1 - exp(
    -qgamma(.05, shape = 1 / pfm["theta", 1],
            scale=pfm["theta", 1]) * exp(pfm["Heifer", 1]) * 
        (365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1] * x ^ (pfm["rho", 1])),
    add = TRUE, lty = 4)


### - Density of the median time - ###
fM <- function(x, heifer = 0) {
    RHO <- pfm["rho", 1]
    LAMBDAd <- (365.25 / 12) ^ (-pfm["rho", 1]) * pfm["lambda", 1]
    THETA <- pfm["theta", 1]
    if (heifer) {
        eBETA <- exp(pfm["Heifer", 1])
    } else eBETA <- 1  
    
    RHO * (log(2) / (THETA * LAMBDAd * eBETA)) ^ (1 / THETA) *
        x^(-1 - RHO / THETA) *
        exp(-log(2) / (THETA * x^RHO * LAMBDAd * eBETA)) /
        gamma(1 / THETA)
}

par(mfrow=c(1, 1))
curve(fM, 0, 300, xlab = "Median time to first insemination (days)",
      ylab = "Density function of the median")
curve(fM(x, heifer = 1), add = TRUE, lty = 3)
legend("topright", legend = c("Multiparous", "Primiparous"),
       lty = c(1, 3), bty = "n")
## End(No test)


