library(LEGIT)


### Name: GxE_interaction_test
### Title: Testing of the GxE interaction
### Aliases: GxE_interaction_test

### ** Examples

## Not run: 
##D ## Examples where x is in [0, 10]
##D # Diathesis Stress WEAK
##D ex_dia = example_with_crossover(250, c=10, coef_main = c(3,1,2), sigma=1)
##D # Diathesis Stress STRONG
##D ex_dia_s = example_with_crossover(250, c=10, coef_main = c(3,0,2), sigma=1)
##D ## Assuming there is a crossover point at x=5
##D # Differential Susceptibility WEAK
##D ex_ds = example_with_crossover(250, c=5, coef_main = c(3+5,1,2), sigma=1)
##D # Differential Susceptibility STRONG
##D ex_ds_s = example_with_crossover(250, c=5, coef_main = c(3+5,0,2), sigma=1)
##D 
##D ## If true model is "Diathesis Stress WEAK"
##D GxE_test_BIC = GxE_interaction_test(ex_dia$data, ex_dia$G, ex_dia$E, 
##D formula_noGxE = y ~ 1, start_genes = ex_dia$coef_G, start_env = ex_dia$coef_E, 
##D criterion="BIC")
##D GxE_test_BIC$results
##D 
##D ## If true model is "Diathesis Stress STRONG"
##D GxE_test_BIC = GxE_interaction_test(ex_dia_s$data, ex_dia_s$G, ex_dia_s$E, 
##D formula_noGxE = y ~ 1, start_genes = ex_dia_s$coef_G, start_env = ex_dia_s$coef_E, 
##D criterion="BIC")
##D GxE_test_BIC$results
##D 
##D ## If true model is "Differential susceptibility WEAK"
##D GxE_test_BIC = GxE_interaction_test(ex_ds$data, ex_ds$G, ex_ds$E, 
##D formula_noGxE = y ~ 1, start_genes = ex_ds$coef_G, start_env = ex_ds$coef_E, 
##D criterion="BIC")
##D GxE_test_BIC$results
##D 
##D ## If true model is "Differential susceptibility STRONG"
##D GxE_test_BIC = GxE_interaction_test(ex_ds_s$data, ex_ds_s$G, ex_ds_s$E, 
##D formula_noGxE = y ~ 1, start_genes = ex_ds_s$coef_G, start_env = ex_ds_s$coef_E,
##D criterion="BIC")
##D GxE_test_BIC$results
##D 
##D # Example of plots
##D plot(GxE_test_BIC$fits$diff_suscept_STRONG, xlim=c(0,10), ylim=c(3,13))
##D plot(GxE_test_BIC$fits$diff_suscept_WEAK, xlim=c(0,10), ylim=c(3,13))
##D plot(GxE_test_BIC$fits$diathesis_stress_STRONG, xlim=c(0,10), ylim=c(3,13))
##D plot(GxE_test_BIC$fits$diathesis_stress_WEAK, xlim=c(0,10), ylim=c(3,13))
## End(Not run)



