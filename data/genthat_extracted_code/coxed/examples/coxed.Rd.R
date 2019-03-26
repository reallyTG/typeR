library(coxed)


### Name: coxed
### Title: Expected durations and marginal changes in expected duration
###   from the Cox proportional hazards model
### Aliases: coxed

### ** Examples

mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm + pgovno +
     tpgovno + minority, method = "breslow", data = martinvanberg)
summary(mv.cox)

# NPSF method
ed1 <- coxed(mv.cox, method="npsf")
ed1$baseline.functions
ed1$exp.dur
summary(ed1, stat="mean")
summary(ed1, stat="median")

## Not run: 
##D ed1 <- coxed(mv.cox, method="npsf", bootstrap = TRUE)
##D ed1$exp.dur
##D summary(ed1, stat="mean")
##D summary(ed1, stat="median")
## End(Not run)

me <- coxed(mv.cox, method="npsf", bootstrap = FALSE,
            newdata = dplyr::mutate(martinvanberg, pgovno=1),
            newdata2 = dplyr::mutate(martinvanberg, pgovno=6))
summary(me, stat="mean")

# GAM method
ed2 <- coxed(mv.cox, method="gam")
summary(ed2$gam.data)
summary(ed2$gam.model)
ed2$exp.dur
summary(ed2, stat="mean")

## Not run: 
##D me <- coxed(mv.cox, method="gam", bootstrap = TRUE,
##D             newdata = dplyr::mutate(martinvanberg, pgovno=1),
##D             newdata2 = dplyr::mutate(martinvanberg, pgovno=6))
##D summary(me, stat="mean")
##D summary(me, stat="median")
## End(Not run)

#Plotting the GAM fit
## Not run: 
##D ggplot(ed2$gam.data, aes(x=rank.xb, y=y)) +
##D     geom_point() +
##D     geom_line(aes(x=rank.xb, y=gam_fit)) +
##D     geom_ribbon(aes(ymin=gam_fit_95lb, ymax=gam_fit_95ub), alpha=.5) +
##D     xlab("Cox model LP rank (smallest to largest)") +
##D     ylab("Duration")
## End(Not run)

#Time-varying covariates
bs.surv <- Surv(time = boxsteffensmeier$start, time2 = boxsteffensmeier$te,
     event = boxsteffensmeier$cut_hi)
bs.cox <- coxph(bs.surv ~ ec + dem + south + iv, data = boxsteffensmeier, method = "breslow")
summary(bs.cox)

ed1 <- coxed(bs.cox, method="npsf", id=boxsteffensmeier$caseid)
ed1$exp.dur
summary(ed1, stat="mean")



