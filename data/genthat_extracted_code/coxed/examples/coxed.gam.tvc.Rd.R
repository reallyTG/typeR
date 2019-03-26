library(coxed)


### Name: coxed.gam.tvc
### Title: Predict expected durations using the GAM method with
###   time-varying covariates
### Aliases: coxed.gam.tvc

### ** Examples

bs.surv <- Surv(time = boxsteffensmeier$start, time2 = boxsteffensmeier$te,
     event = boxsteffensmeier$cut_hi)
bs.cox <- coxph(bs.surv ~ ec + dem + south + iv, data = boxsteffensmeier, method = "breslow")
summary(bs.cox)

ed <- coxed.gam.tvc(bs.cox, cluster=boxsteffensmeier$caseid)
ed$exp.dur



