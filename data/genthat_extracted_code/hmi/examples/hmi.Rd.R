library(hmi)


### Name: hmi
### Title: hmi: Hierarchical Multilevel Imputation.
### Aliases: hmi

### ** Examples

## Not run: 
##D  data(Gcsemv, package = "hmi")
##D 
##D  model_formula <- written ~ 1 + gender + coursework + (1 + gender|school)
##D 
##D  set.seed(123)
##D  dat_imputed <- hmi(data = Gcsemv, model_formula = model_formula, m = 2, maxit = 2)
##D  #See ?hmi_pool for how to pool results.
## End(Not run)



