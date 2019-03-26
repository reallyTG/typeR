library(emdi)


### Name: direct
### Title: Direct estimation of disaggregated indicators
### Aliases: direct

### ** Examples

## Not run: 
##D # Loading sample data
##D data("eusilcA_smp")
##D 
##D # Example 1: Without weights and naive bootstrap
##D emdi_direct <- direct(y = "eqIncome", smp_data = eusilcA_smp, 
##D smp_domains = "district", weights = "weight", threshold = 11064.82, var = TRUE, 
##D boot_type = "naive", B = 50, seed = 123, X_calib = NULL, totals = NULL, 
##D na.rm = TRUE)
##D 
##D # Example 2: With function as threshold
##D emdi_direct <- direct(y = "eqIncome", smp_data = eusilcA_smp, 
##D smp_domains = "district", weights = "weight", threshold = 
##D function(y, weights){0.6 * laeken::weightedMedian(y, weights)}, na.rm = TRUE)
##D 
##D # Example 3: With custom indicators
##D emdi_direct <- direct(y = "eqIncome", smp_data = eusilcA_smp, 
##D smp_domains = "district", weights = "weight", threshold = 10859.24, 
##D var = TRUE, boot_type = "naive", B = 50, seed = 123, X_calib = NULL, 
##D totals = NULL, custom_indicator = list(my_max = function(y, weights, 
##D threshold){max(y)}, my_min = function(y, weights, threshold){min(y)}), 
##D na.rm = TRUE)
## End(Not run)



