library(finalfit)


### Name: surv_plot
### Title: Plot survival curves with number-at-risk table
### Aliases: surv_plot

### ** Examples

library(finalfit)
library(dplyr)

# Survival plot
data(colon_s)
explanatory = c("perfor.factor")
dependent = "Surv(time, status)"
colon_s %>%
  surv_plot(dependent, explanatory, xlab="Time (days)", pval=TRUE, legend="none")




