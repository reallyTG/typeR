library(breathteststan)


### Name: coef_diff_by_group
### Title: Tabulates breath test parameter differences of groups from Stan
###   group fit
### Aliases: coef_diff_by_group coef_diff_by_group.breathteststangroupfit

### ** Examples

## No test: 
library(dplyr)
library(breathtestcore)
data("usz_13c", package = "breathtestcore")
data = usz_13c %>%
  dplyr::filter( patient_id %in%
    c("norm_001", "norm_002", "norm_003", "norm_004", "pat_001", "pat_002","pat_003")) %>%
  cleanup_data()
fit = stan_group_fit(data, iter = 300, chains = 1) # Use more iterations!
cf = coef_diff_by_group(fit)
cc = attr(cf, "chain") %>%
   filter(key == "t50_maes_ghoos", abs(diff) < 200) %>%
   mutate(
     groups = paste(group2, group1, sep = " - ")
   )
str(cc)
if (require(ggplot2)) {
  ggplot(cc, aes(x = diff)) + geom_histogram() + facet_wrap(~groups)
}
# For comparison
fit = nlme_fit(data)
coef_diff_by_group(fit)
## End(No test)



