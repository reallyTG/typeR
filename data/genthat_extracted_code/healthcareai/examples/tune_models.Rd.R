library(healthcareai)


### Name: tune_models
### Title: Tune multiple machine learning models using cross validation to
###   optimize performance
### Aliases: tune_models

### ** Examples

## Not run: 
##D ### Examples take about 30 seconds to run
##D # Prepare data for tuning
##D d <- prep_data(pima_diabetes, patient_id, outcome = diabetes)
##D 
##D # Tune random forest, xgboost, and regularized regression classification models
##D m <- tune_models(d)
##D 
##D # Get some info about the tuned models
##D m
##D 
##D # Get more detailed info
##D summary(m)
##D 
##D # Plot performance over hyperparameter values for each algorithm
##D plot(m)
##D 
##D # To specify hyperparameter values to tune over, pass a data frame
##D # of hyperparameter values to the hyperparameters argument:
##D rf_hyperparameters <-
##D   expand.grid(
##D     mtry = 1:5,
##D     splitrule = c("gini", "extratrees"),
##D     min.node.size = 1
##D   )
##D grid_search_models <-
##D   tune_models(d = d,
##D               outcome = diabetes,
##D               models = "rf",
##D               hyperparameters = list(rf = rf_hyperparameters)
##D   )
##D plot(grid_search_models)
## End(Not run)



