library(emdi)


### Name: tail.estimators.emdi
### Title: Returns the last part of predicted indicators and, if chosen, of
###   MSE and CV estimators.
### Aliases: tail.estimators.emdi

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # Generate emdi object with deleting missing values; here via function ebp()
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj,
##D pop_data = eusilcA_pop, pop_domains = "district",
##D smp_data = eusilcA_smp, smp_domains = "district",
##D na.rm = TRUE)
##D 
##D # Example: Choose last lines of the Gini coefficient, MSE and CV
##D tail(estimators(emdi_model, indicator = c("Gini", "Head_Count")))
## End(Not run)



