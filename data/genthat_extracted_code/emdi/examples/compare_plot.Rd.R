library(emdi)


### Name: compare_plot
### Title: Shows plots for the comparison of direct and model-based
###   estimates
### Aliases: compare_plot

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D   
##D # Generation of two emdi objects
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D threshold = function(y){0.6 * median(y)}, L = 50, MSE = TRUE,
##D na.rm = TRUE, cpus = 1)
##D 
##D emdi_direct <- direct(y = "eqIncome", smp_data = eusilcA_smp,
##D smp_domains = "district", weights = "weight", threshold = 11161.44,
##D var = TRUE, boot_type = "naive", B = 50, seed = 123, na.rm = TRUE)
##D 
##D # Example 1: Receive first overview
##D compare_plot(direct = emdi_direct, model = emdi_model)
##D 
##D # Example 2: Change plot theme
##D library(ggplot2)
##D compare_plot(emdi_direct, emdi_model, indicator = "Median",
##D gg_theme = theme(axis.line = element_line(size = 3, colour = "grey80"),
##D plot.background = element_rect(fill = "lightblue3"),
##D legend.position = "none"))
## End(Not run)



