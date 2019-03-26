library(coxed)


### Name: coxed.npsf.tvc
### Title: Predict expected durations using the GAM method with
###   time-varying covariates
### Aliases: coxed.npsf.tvc

### ** Examples

bs.surv <- Surv(time = boxsteffensmeier$start, time2 = boxsteffensmeier$te,
     event = boxsteffensmeier$cut_hi)
bs.cox <- coxph(bs.surv ~ ec + dem + south + iv, data = boxsteffensmeier, method = "breslow")

ed <- coxed.npsf.tvc(bs.cox, cluster=boxsteffensmeier$caseid)
ed$exp.dur



