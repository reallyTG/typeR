library(parfm)


### Name: ecf
### Title: East Coast Fever transmission dynamics
### Aliases: ecf
### Keywords: datasets ecf cows Theileriosis East Coast Fever infection
###   frailty

### ** Examples

## No test: 
data(ecf)
head(ecf)

################################################################################
#Example 3.8: Population and conditional hazard for time to ECF contact        #
#Duchateau and Janssen (2008, page 113)                                        #
################################################################################
pfm1 <- parfm(Surv(Time, Status) ~ 1, cluster = "Cowid", data = ecf,
              dist = "weibull", frailty = "gamma")
pfm2 <- parfm(Surv(Time, Status) ~ Breed, cluster = "Cowid", data = ecf,
              dist = "weibull", frailty = "gamma")
curve(pfm1["lambda", 1] * pfm1["rho", 1] * x ^ (pfm1["rho", 1] - 1),
      from = 0, to = 400, ylim = c(0, .15), 
      ylab = "Hazard function", xlab = "Time (days)")
curve(qgamma(.75, shape = 1 / pfm1["theta", 1],
             scale = pfm1["theta", 1]) * pfm1["lambda", 1] * pfm1["rho", 1] *
                x ^ (pfm1["rho", 1] - 1),
      add = TRUE, lty = 2)
curve(qgamma(.25, shape=1 / pfm1["theta", 1],
             scale = pfm1["theta", 1]) * pfm1["lambda", 1] * pfm1["rho", 1] *
               x ^ (pfm1["rho", 1] - 1),
      add = TRUE, lty = 3)
curve(pfm1["lambda", 1] * pfm1["rho", 1] *
        x ^ (pfm1["rho", 1] - 1) / (
            1 + pfm1["theta", 1] * pfm1["lambda", 1] * x ^ (pfm1["rho", 1])
      ),
      add = TRUE, lwd = 2)
legend("top", lwd = c(1, 1, 1, 2), lty = c(1, 2, 3, 1), ncol = 2,
       legend = c("Mean frailty", "Q75 frailty", "Q25 frailty", "Population"))
## End(No test)


