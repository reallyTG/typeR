library(coxed)


### Name: summary.coxedMargin
### Title: Marginal changes in expected duration
### Aliases: summary.coxedMargin

### ** Examples

mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm + pgovno + tpgovno +
     minority, method = "breslow", data = martinvanberg)
summary(mv.cox)

me <- coxed(mv.cox, method="npsf", bootstrap = FALSE,
            newdata = dplyr::mutate(martinvanberg, rgovm=0),
            newdata2 = dplyr::mutate(martinvanberg, rgovm=1.24))
summary(me, stat="mean")
summary(me, stat="median")



