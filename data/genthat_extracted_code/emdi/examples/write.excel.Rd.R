library(emdi)


### Name: write.excel
### Title: Exports an emdiObject to an excel file or OpenDocument
###   Spreadsheet
### Aliases: write.excel write.ods

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # Generate emdi object with two additional indicators
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D threshold = function(y){0.6 * median(y)}, L = 50, MSE = TRUE, B = 50, 
##D custom_indicator = list( my_max = function(y, threshold){max(y)},
##D my_min = function(y, threshold){min(y)}), na.rm = TRUE, cpus = 1)
##D 
##D # Example 1: Export estimates for all indicators and uncertainty measures and 
##D # diagnostics to Excel
##D write.excel(emdi_model, file = "excel_output_all.xlsx", indicator = "all", 
##D MSE = TRUE, CV = TRUE)
##D 
##D # Example 2: Single Excel sheets for point, MSE and CV estimates
##D write.excel(emdi_model, file = "excel_output_all_split.xlsx", indicator = "all", 
##D MSE = TRUE, CV = TRUE, split = TRUE)
##D 
##D # Example 3: Same as example 1 but for an ODS output
##D write.ods(emdi_model, file = "ods_output_all.ods", indicator = "all", 
##D MSE = TRUE, CV = TRUE)
## End(Not run)




