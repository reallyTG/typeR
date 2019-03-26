library(coxed)


### Name: coxed.gam
### Title: Predict expected durations using the GAM method
### Aliases: coxed.gam

### ** Examples

mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm +
pgovno + tpgovno + minority, method = "breslow", data = martinvanberg)

ed <- coxed.gam(mv.cox)
summary(ed$gam.data)
summary(ed$gam.model)
ed$exp.dur

#Plotting the GAM fit
## Not run: 
##D require(ggplot2)
##D ggplot(ed$gam.data, aes(x=rank.xb, y=y)) +
##D     geom_point() +
##D     geom_line(aes(x=rank.xb, y=gam_fit)) +
##D     geom_ribbon(aes(ymin=gam_fit_95lb, ymax=gam_fit_95ub), alpha=.5) +
##D     xlab("Cox model LP rank (smallest to largest)") +
##D     ylab("Duration")
## End(Not run)

#Running coxed.gam() on a bootstrap sample and with new coefficients
bsample <- sample(1:nrow(martinvanberg), nrow(martinvanberg), replace=TRUE)
newcoefs <- rnorm(8)
ed2 <- coxed.gam(mv.cox, b.ind=bsample, coef=newcoefs)



