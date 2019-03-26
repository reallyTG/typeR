library(survminer)


### Name: ggsurvplot_df
### Title: Plot Survival Curves from Survival Summary Data Frame
### Aliases: ggsurvplot_df

### ** Examples

library(survival)

# Fit survival curves
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit1 <- survfit( Surv(time, status) ~ 1, data = colon)
fit2 <- survfit( Surv(time, status) ~ adhere, data = colon)

# Summary
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
head(surv_summary(fit1, colon))

head(surv_summary(fit2, colon))

# Visualize
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ggsurvplot_df(surv_summary(fit1, colon))

ggsurvplot_df(surv_summary(fit2, colon), conf.int = TRUE,
             legend.title = "Adhere", legend.labs = c("0", "1"))

# Kaplan-Meier estimate
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
out_km <- survfit(Surv(time, status) ~ 1, data = lung)

# Weibull model
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
wb <- survreg(Surv(time, status) ~ 1, data = lung)
s <- seq(.01, .99, by = .01)
t <- predict(wb, type = "quantile", p = s, newdata = lung[1, ])
out_wb <- data.frame(time = t, surv = 1 - s, upper = NA, lower = NA, std.err = NA)

# plot both
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
p_km <- ggsurvplot(out_km, conf.int = FALSE)
p_wb <- ggsurvplot(out_wb, conf.int = FALSE, surv.geom = geom_line)

p_km
p_wb
p_km$plot + geom_line(data = out_wb, aes(x = time, y = surv))




