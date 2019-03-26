library(survminer)


### Name: surv_pvalue
### Title: Compute P-value Comparing Survival Curves
### Aliases: surv_pvalue

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
surv_pvalue(fit.null)

surv_pvalue(fit2, colon)

surv_pvalue(fit.list)

surv_pvalue(fit.list, combine = TRUE)

# Grouped survfit
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit.list2 <- surv_fit(Surv(time, status) ~ sex, data = colon,
                     group.by = "rx")

surv_pvalue(fit.list2)

# Get coordinate for annotion of the survival plots
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
surv_pvalue(fit.list2, combine = TRUE, get_coord = TRUE)




