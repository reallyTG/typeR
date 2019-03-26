library(JointAI)


### Name: get_MIdat
### Title: Extract multiple imputed datasets
### Aliases: get_MIdat

### ** Examples

# fit a model and monitor the imputed values with monitor_params = c(imps = TRUE)#'
mod <- lm_imp(y~C1 + C2 + M2, data = wideDF, monitor_params = c(imps = TRUE), n.iter = 100)

# Example 1: without export to SPSS
MIs <- get_MIdat(mod, m = 3, seed = 123)

## Not run: 
##D # Example 2: with export for SPSS (here: to the temporary directory "temp_dir")
##D temp_dir <- tempdir()
##D MIs <- get_MIdat(mod, m = 3, seed = 123, resdir = temp_dir,
##D                  filename = "example_imputation",
##D                  export_to_SPSS = TRUE)
##D 
## End(Not run)



