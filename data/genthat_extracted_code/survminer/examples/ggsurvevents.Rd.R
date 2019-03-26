library(survminer)


### Name: ggsurvevents
### Title: Distribution of Events' Times
### Aliases: ggsurvevents

### ** Examples

require("survival")
# from Surv
surv <- Surv(lung$time, lung$status)
ggsurvevents(surv)

surv2 <- Surv(colon$time, colon$status)
ggsurvevents(surv2)
ggsurvevents(surv2, normalized = TRUE)

# from survfit
fit <- survfit(Surv(time, status) ~ sex, data = lung)
ggsurvevents(fit = fit, data = lung)

# from coxph
model <- coxph( Surv(time, status) ~ sex + rx + adhere, data = colon )
ggsurvevents(fit = model, data = colon)
ggsurvevents(surv2, normalized = TRUE, type = "radius")
ggsurvevents(surv2, normalized = TRUE, type = "fraction")




