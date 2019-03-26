library(breathtestcore)


### Name: coef_by_group
### Title: Tabulates per-group breath test parameters
### Aliases: coef_by_group

### ** Examples

library(dplyr)
data("usz_13c")
data = usz_13c %>%
  dplyr::filter( patient_id %in%
    c("norm_001", "norm_002", "norm_003", "norm_004", "pat_001", "pat_002","pat_003")) %>%
  cleanup_data()
fit = nls_fit(data)
coef_by_group(fit)
## No test: 
fit = nlme_fit(data)
coef_by_group(fit)
## End(No test)



