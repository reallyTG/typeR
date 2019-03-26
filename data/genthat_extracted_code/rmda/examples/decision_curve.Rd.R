library(rmda)


### Name: decision_curve
### Title: Calculate net benefit/decision curves
### Aliases: decision_curve

### ** Examples

#helper function
expit <- function(xx) exp(xx)/ (1+exp(xx))

#load simulated cohort data
data(dcaData)
baseline.model <- decision_curve(Cancer~Age + Female + Smokes,
                                data = dcaData,
                                thresholds = seq(0, .4, by = .01),
                                study.design = 'cohort',
                                bootstraps = 10) #number of bootstraps should be higher

full.model <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                            data = dcaData,
                            thresholds = seq(0, .4, by = .01),
                            bootstraps = 10)

#simulated case-control data with same variables as above
data(dcaData_cc)

table(dcaData_cc$Cancer)

#estimated from the population where the
#case-control sample comes from.
population.rho = 0.11

full.model_cc <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                               data = dcaData,
                               thresholds = seq(0, .4, by = .01),
                               bootstraps = 10,
                               study.design = 'case-control',
                               population.prevalence = population.rho)

#estimate the net benefit for an 'opt-out' policy.
nb.opt.out  <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                            data = dcaData,
                            policy = 'opt-out',
                            thresholds = seq(0, .4, by = .01),
                            bootstraps = 10)





