library(survminer)


### Name: ggrisktable
### Title: Plot Survival Tables
### Aliases: ggrisktable ggcumevents ggcumcensor ggsurvtable

### ** Examples

# Fit survival curves
#:::::::::::::::::::::::::::::::::::::::::::::::
require("survival")
fit<- survfit(Surv(time, status) ~ sex, data = lung)

# Survival tables
#:::::::::::::::::::::::::::::::::::::::::::::::
tables <- ggsurvtable(fit, data = lung, color = "strata",
  y.text = FALSE)

# Risk table
tables$risk.table

# Number of cumulative events
tables$cumevents

# Number of cumulative censoring
tables$cumcensor



