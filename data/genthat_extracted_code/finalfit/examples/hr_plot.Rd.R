library(finalfit)


### Name: hr_plot
### Title: Produce a hazard ratio table and plot
### Aliases: hr_plot

### ** Examples

# HR plot
library(finalfit)
library(dplyr)
library(ggplot2)

data(colon_s)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "Surv(time, status)"
colon_s %>%
  hr_plot(dependent, explanatory, dependent_label = "Survival")

colon_s %>%
  hr_plot(dependent, explanatory, dependent_label = "Survival",
    table_text_size=4, title_text_size=14,
    plot_opts=list(xlab("OR, 95% CI"), theme(axis.title = element_text(size=12))))




