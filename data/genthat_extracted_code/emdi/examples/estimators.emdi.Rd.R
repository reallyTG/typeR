library(emdi)


### Name: estimators.emdi
### Title: Presents point, MSE and/or CV estimates of an emdiObject
### Aliases: estimators.emdi

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # Generate emdi object with additional indicators; here via function ebp()
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D threshold = 11064.82, transformation = "box.cox", 
##D L = 50, MSE = TRUE, B = 50, custom_indicator = 
##D list(my_max = function(y, threshold){max(y)},
##D my_min = function(y, threshold){min(y)}), na.rm = TRUE, cpus = 1)
##D 
##D # Example 1: Choose Gini coefficient, MSE and CV
##D estimators(emdi_model, indicator = "Gini", MSE = TRUE, CV = TRUE)
##D 
##D # Example 2: Choose custom indicators without MSE and CV
##D estimators(emdi_model, indicator = "Custom")
## End(Not run)



