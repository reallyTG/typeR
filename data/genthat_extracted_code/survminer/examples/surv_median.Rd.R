library(survminer)


### Name: surv_median
### Title: Median of Survival Curves
### Aliases: surv_median

### ** Examples


library(survival)

# Different survfits
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit.null <- surv_fit(Surv(time, status) ~ 1, data = colon)

fit1 <- surv_fit(Surv(time, status) ~ sex, data = colon)

fit2 <- surv_fit(Surv(time, status) ~ adhere, data = colon)

fit.list <- list(sex = fit1, adhere = fit2)

# Extract the median survival
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
surv_median(fit.null)

surv_median(fit2)

surv_median(fit.list)

surv_median(fit.list, combine = TRUE)

# Grouped survfit
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit.list2 <- surv_fit(Surv(time, status) ~ sex, data = colon,
                     group.by = "rx")
surv_median(fit.list2)



