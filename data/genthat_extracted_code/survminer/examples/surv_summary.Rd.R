library(survminer)


### Name: surv_summary
### Title: Nice Summary of a Survival Curve
### Aliases: surv_summary

### ** Examples


# Fit survival curves
require("survival")
fit <- survfit(Surv(time, status) ~ rx + adhere, data = colon)

# Summarize
res.sum <- surv_summary(fit, data = colon)
head(res.sum)

# Information about the survival curves
attr(res.sum, "table")





