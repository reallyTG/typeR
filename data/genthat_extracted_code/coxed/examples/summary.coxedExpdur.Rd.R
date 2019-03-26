library(coxed)


### Name: summary.coxedExpdur
### Title: The mean or median expected duration
### Aliases: summary.coxedExpdur

### ** Examples

require(survival)
mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm + pgovno + tpgovno +
     minority, method = "breslow", data = martinvanberg)
summary(mv.cox)

# NPSF method
ed1 <- coxed(mv.cox, method="npsf")
ed1$baseline.functions
ed1$exp.dur
summary(ed1, stat="mean")
summary(ed1, stat="median")

ed1 <- coxed(mv.cox, method="npsf", bootstrap = TRUE)
ed1$exp.dur
summary(ed1, stat="mean")
summary(ed1, stat="median")



