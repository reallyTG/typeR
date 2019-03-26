library(breathtestcore)


### Name: nls_fit
### Title: Individual curve fit with nls to 13C breath test data
### Aliases: nls_fit

### ** Examples

d = simulate_breathtest_data(n_records = 3, noise = 0.2, seed = 4711)
data = cleanup_data(d$data)
fit = nls_fit(data)
plot(fit) # calls plot.breathtestfit
options(digits = 2)
cf = coef(fit)
library(dplyr)
cf %>% 
  filter(grepl("m|k|beta", parameter )) %>% 
  select(-method, -group) %>% 
  tidyr::spread(parameter, value) %>% 
  inner_join(d$record, by = "patient_id") %>% 
  select(patient_id, m_in = m.y, m_out = m.x, 
         beta_in = beta.y, beta_out = beta.x,
         k_in = k.y, k_out = k.x)



