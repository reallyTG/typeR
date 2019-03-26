library(breathtestcore)


### Name: coef_diff_by_group
### Title: Tabulates breath test parameter differences of groups
### Aliases: coef_diff_by_group

### ** Examples

library(dplyr)
data("usz_13c")
data = usz_13c %>%
  dplyr::filter( patient_id %in%
    c("norm_001", "norm_002", "norm_003", "norm_004", "pat_001", "pat_002","pat_003")) %>%
  cleanup_data()
fit = nls_fit(data)
coef_diff_by_group(fit)
## No test: 
fit = nlme_fit(data)
coef_diff_by_group(fit)
## End(No test)
# TODO: Add example for Stan fit typecast to class \code{breathtestfit} to compute
# confidence intervals instead of credible intervals



