library(emdi)


### Name: summary.emdi
### Title: Summarizes an emdiObject
### Aliases: summary.emdi

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D   
##D # Example with two additional indicators
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D threshold = function(y){0.6 * median(y)}, L = 50, MSE = TRUE, B = 50, 
##D custom_indicator = list( my_max = function(y, threshold){max(y)},
##D my_min = function(y, threshold){min(y)}), na.rm = TRUE, cpus = 1)
##D 
##D # Receive first overview
##D summary(emdi_model)
## End(Not run)



