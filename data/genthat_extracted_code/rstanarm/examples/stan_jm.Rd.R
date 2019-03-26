library(rstanarm)


### Name: stan_jm
### Title: Bayesian joint longitudinal and time-to-event models via Stan
### Aliases: stan_jm

### ** Examples

## No test: 
#####
# Univariate joint model, with association structure based on the 
# current value of the linear predictor
f1 <- stan_jm(formulaLong = logBili ~ year + (1 | id), 
              dataLong = pbcLong,
              formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
              dataEvent = pbcSurv,
              time_var = "year",
              # this next line is only to keep the example small in size!
              chains = 1, cores = 1, seed = 12345, iter = 1000)
print(f1) 
summary(f1) 
        
#####
# Univariate joint model, with association structure based on the 
# current value and slope of the linear predictor
f2 <- stan_jm(formulaLong = logBili ~ year + (year | id), 
              dataLong = pbcLong,
              formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
              dataEvent = pbcSurv,
              assoc = c("etavalue", "etaslope"),
              time_var = "year",
              chains = 1, cores = 1, seed = 12345, iter = 1000)
print(f2)  

#####
# Univariate joint model, with association structure based on the 
# lagged value of the linear predictor, where the lag is 2 time 
# units (i.e. 2 years in this example)
f3 <- stan_jm(formulaLong = logBili ~ year + (1 | id), 
              dataLong = pbcLong,
              formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
              dataEvent = pbcSurv,
              time_var = "year",
              assoc = "etavalue", lag_assoc = 2,
              chains = 1, cores = 1, seed = 12345, iter = 1000)
print(f3) 

#####
# Univariate joint model, where the association structure includes 
# interactions with observed data. Here we specify that we want to use 
# an association structure based on the current value of the linear 
# predictor from the longitudinal submodel (i.e. "etavalue"), but we 
# also want to interact this with the treatment covariate (trt) from
# pbcLong data frame, so that we can estimate a different association 
# parameter (i.e. estimated effect of log serum bilirubin on the log 
# hazard of death) for each treatment group
f4 <- stan_jm(formulaLong = logBili ~ year + (1 | id), 
              dataLong = pbcLong,
              formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
              dataEvent = pbcSurv,
              time_var = "year",
              assoc = c("etavalue", "etavalue_data(~ trt)"),
              chains = 1, cores = 1, seed = 12345, iter = 1000)
print(f4)

######
# Multivariate joint model, with association structure based 
# on the current value and slope of the linear predictor in the 
# first longitudinal submodel and the area under the marker 
# trajectory for the second longitudinal submodel
mv1 <- stan_jm(
        formulaLong = list(
          logBili ~ year + (1 | id), 
          albumin ~ sex + year + (year | id)),
        dataLong = pbcLong,
        formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
        dataEvent = pbcSurv,
        assoc = list(c("etavalue", "etaslope"), "etaauc"), 
        time_var = "year",
        chains = 1, cores = 1, seed = 12345, iter = 100)
print(mv1)

#####
# Multivariate joint model, where the association structure is formed by 
# including the expected value of each longitudinal marker (logBili and 
# albumin) in the linear predictor of the event submodel, as well as their 
# interaction effect (i.e. the interaction between the two "etavalue" terms). 
# Note that whether such an association structure based on a marker by 
# marker interaction term makes sense will depend on the context of your 
# application -- here we just show it for demostration purposes).
mv2 <- stan_jm(
        formulaLong = list(
          logBili ~ year + (1 | id), 
          albumin ~ sex + year + (year | id)),
        dataLong = pbcLong,
        formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
        dataEvent = pbcSurv,
        assoc = list(c("etavalue", "etavalue_etavalue(2)"), "etavalue"),
        time_var = "year", 
        chains = 1, cores = 1, seed = 12345, iter = 100)
        
#####
# Multivariate joint model, with one bernoulli marker and one
# Gaussian marker. We will artificially create the bernoulli
# marker by dichotomising log serum bilirubin
pbcLong$ybern <- as.integer(pbcLong$logBili >= mean(pbcLong$logBili))
mv3 <- stan_jm(
        formulaLong = list(
          ybern ~ year + (1 | id), 
          albumin ~ sex + year + (year | id)),
        dataLong = pbcLong,
        formulaEvent = Surv(futimeYears, death) ~ sex + trt, 
        dataEvent = pbcSurv,
        family = list(binomial, gaussian),
        time_var = "year", 
        chains = 1, cores = 1, seed = 12345, iter = 1000)
## End(No test)




