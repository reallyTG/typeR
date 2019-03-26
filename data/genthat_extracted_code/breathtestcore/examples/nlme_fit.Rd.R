library(breathtestcore)


### Name: nlme_fit
### Title: Mixed-model nlme fit to 13C Breath Data
### Aliases: nlme_fit

### ** Examples

d = simulate_breathtest_data(n_records = 3, noise = 0.7, seed = 4712)
data = cleanup_data(d$data)
fit = nlme_fit(data)
plot(fit) # calls plot.breathtestfit
options(digits = 3)
library(dplyr)
cf = coef(fit)
# The coefficients are in long key-value format
cf
# AIC can be extracted
AIC(fit)
# Reformat the coefficients to wide format and compare 
# with the expected coefficients from the simulation 
# in d$record.
cf %>%
  filter(grepl("m|k|beta", parameter )) %>%
  select(-method, -group) %>%
  tidyr::spread(parameter, value) %>%
  inner_join(d$record, by = "patient_id") %>%
  select(patient_id, m_in = m.y, m_out = m.x,
         beta_in = beta.y, beta_out = beta.x,
         k_in = k.y, k_out = k.x)



