library(coxed)


### Name: coxed.npsf
### Title: Predict expected durations using the GAM method
### Aliases: coxed.npsf

### ** Examples

mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm + pgovno + tpgovno +
     minority, method = "breslow", data = martinvanberg)

ed <- coxed.npsf(mv.cox)
ed$baseline.functions
ed$exp.dur

#Running coxed.npsf() on a bootstrap sample and with new coefficients
bsample <- sample(1:nrow(martinvanberg), nrow(martinvanberg), replace=TRUE)
newcoefs <- rnorm(8)
ed2 <- coxed.npsf(mv.cox, b.ind=bsample, coef=newcoefs)



