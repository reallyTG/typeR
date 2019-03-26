library(survminer)


### Name: ggsurvplot_add_all
### Title: Add Survival Curves of Pooled Patients onto the Main Plot
### Aliases: ggsurvplot_add_all

### ** Examples

library(survival)

# Fit survival curves
fit <- surv_fit(Surv(time, status) ~ sex, data = lung)

# Visualize survival curves
ggsurvplot(fit, data = lung,
          risk.table = TRUE, pval = TRUE,
          surv.median.line = "hv", palette = "jco")

# Add survival curves of pooled patients (Null model)
# Use add.all = TRUE option
ggsurvplot(fit, data = lung,
          risk.table = TRUE, pval = TRUE,
          surv.median.line = "hv", palette = "jco",
          add.all = TRUE)




