library(hmi)


### Name: hmi_pool
### Title: Averages the results of the imputation function 'hmi'.
### Aliases: hmi_pool

### ** Examples

## Not run: 
##D  data(Gcsemv, package = "hmi")
##D 
##D  model_formula <- written ~ 1 + gender + coursework + (1 + gender|school)
##D 
##D  set.seed(123)
##D  dat_imputed <- hmi(data = Gcsemv, model_formula = model_formula, M = 2, maxit = 2)
##D 
##D  my_analysis <- function(complete_data){
##D   # In this list, you can write all the parameters you are interested in.
##D   # Those will be averaged.
##D   # So make sure that averaging makes sense and that you only put in single numeric values.
##D   parameters_of_interest <- list()
##D 
##D   # ---- write in the following lines, what you are interetest in to do with your complete_data
##D   # the following lines are an example where the analyst is interested in the fixed intercept
##D   # and fixed slope and the random intercepts variance,
##D   # the random slopes variance and their covariance
##D   my_model <- lmer(model_formula, data = complete_data)
##D 
##D   parameters_of_interest[[1]] <- fixef(my_model)
##D   parameters_of_interest[[2]] <- lme4::VarCorr(my_model)[[1]][,]
##D   ret <- unlist(parameters_of_interest)# This line is essential if the elements of interest
##D   #should be labeled in the following line.
##D   names(ret) <-
##D     c("beta_intercept", "beta_gender", "beta_coursework", "sigma0", "sigma01", "sigma10", "sigma1")
##D 
##D   return(ret)
##D }
##D hmi_pool(mids = dat_imputed, analysis_function = my_analysis)
##D #if you are interested in fixed effects only, consider pool from mice:
##D pool(with(data = dat_imputed, expr = lmer(written ~ 1 + gender + coursework + (1 + gender|school))))
## End(Not run)



