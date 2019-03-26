library(parfm)


### Name: parfm
### Title: Parametric Frailty Models
### Aliases: parfm coef.parfm logLik.parfm plot.parfm print.parfm
### Keywords: survival frailty parametric marginal likelihood shared

### ** Examples

#------Kidney dataset------
data(kidney) 
 # type 'help(kidney)' for a description of the data set
kidney$sex <- kidney$sex - 1

parfm(Surv(time,status) ~ sex + age, cluster = "id",
      data = kidney, dist = "exponential", frailty = "gamma")
      
      
## No test: 
parfm(Surv(time,status) ~ sex + age, cluster = "id",
      data = kidney, dist = "exponential", frailty = "lognormal")

parfm(Surv(time,status) ~ sex + age, cluster = "id",
      data = kidney, dist = "weibull", frailty = "ingau")

parfm(Surv(time,status) ~ sex + age, cluster = "id",
      data = kidney, dist="gompertz", frailty="possta", method="CG")


parfm(Surv(time,status) ~ sex + age, cluster = "id",
      data = kidney, dist="logskewnormal", frailty="possta", method = 'BFGS')
#--------------------------

#------Asthma dataset------
data(asthma)
head(asthma)
  # type 'help(asthma)' for a description of the data set

asthma$time <- asthma$End - asthma$Begin
parfm(Surv(time, Status) ~ Drug, cluster = "Patid", data = asthma,
      dist = "weibull", frailty = "gamma")
      
parfm(Surv(time, Status) ~ Drug, cluster = "Patid", data = asthma,
      dist = "weibull", frailty = "lognormal")

parfm(Surv(Begin, End, Status) ~ Drug, cluster = "Patid", 
      data = asthma[asthma$Fevent == 0, ],
      dist = "weibull", frailty = "lognormal", method = "Nelder-Mead")
#--------------------------
## End(No test)



