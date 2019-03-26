library(survivalAnalysis)


### Name: kaplan_meier_plot
### Title: Kaplan Meier plots from survival results.
### Aliases: kaplan_meier_plot

### ** Examples

library(magrittr)
library(dplyr)
survival::aml %>%
  analyse_survival(vars(time, status), x) %>%
  kaplan_meier_plot(break.time.by="breakByMonth",
                    xlab=".OS.months",
                    risk.table=TRUE,
                    ggtheme=ggplot2::theme_bw(10))



