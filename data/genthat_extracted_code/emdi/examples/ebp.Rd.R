library(emdi)


### Name: ebp
### Title: Empirical Best Prediction for disaggregated indicators
### Aliases: ebp

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # Example 1: With default setting but na.rm=TRUE 
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + self_empl + 
##D unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + fam_allow + 
##D house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district", 
##D na.rm = TRUE)
##D 
##D 
##D # Example 2: With MSE, two additional indicators and function as threshold -
##D # Please note that the example runs for several minutes. For a short check
##D # change L and B to lower values.
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D threshold = function(y){0.6 * median(y)}, transformation = "log", 
##D L = 50, MSE = TRUE, boot_type = "wild", B = 50, custom_indicator = 
##D list(my_max = function(y, threshold){max(y)},
##D my_min = function(y, threshold){min(y)}), na.rm = TRUE, cpus = 1)
## End(Not run)



