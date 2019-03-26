library(survutils)


### Name: get_surv_prob
### Title: Get Survival Probability at Specified Times
### Aliases: get_surv_prob

### ** Examples

library("survival")

# Get Survival Probabilities Based on Whole Cohort
fit <- survfit(Surv(time, status) ~ 1, data = colon)
times <- c(100, 200, 300)
get_surv_prob(fit, times)

# Get Survival Probabilities for Each rx Group
library("purrr")
library("dplyr")
library("tidyr")

surv.prob.res <- 
  colon %>%
  split(.$rx) %>%
  map(~ survfit(Surv(time, status) ~ 1, data = .)) %>%
  map(get_surv_prob, times)

surv.prob.res.df <- as_data_frame(surv.prob.res)
colnames(surv.prob.res.df) <- names(surv.prob.res)
surv.prob.res.df <-
  surv.prob.res.df %>%
  mutate(surv_prob_time = times)

gather(surv.prob.res.df, "group", "surv_prob", Obs:`Lev+5FU`)



