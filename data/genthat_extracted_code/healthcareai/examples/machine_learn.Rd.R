library(healthcareai)


### Name: machine_learn
### Title: Machine learning made easy
### Aliases: machine_learn

### ** Examples

# These examples take about 30 seconds to execute so aren't run automatically,
# but you should be able to execute this code locally.
## Not run: 
##D # Split the data into training and test sets
##D d <- split_train_test(d = pima_diabetes,
##D                       outcome = diabetes,
##D                       percent_train = .9)
##D 
##D ### Classification ###
##D 
##D # Clean and prep the training data, specifying that patient_id is an ID column,
##D # and tune algorithms over hyperparameter values to predict diabetes
##D diabetes_models <- machine_learn(d$train, patient_id, outcome = diabetes)
##D 
##D # Inspect model specification and performance
##D diabetes_models
##D 
##D # Make predictions (predicted probability of diabetes) on test data
##D predict(diabetes_models, d$test)
##D 
##D ### Regression ###
##D 
##D # If the outcome variable is numeric, regression models will be trained
##D age_model <- machine_learn(d$train, patient_id, outcome = age)
##D 
##D # Get detailed information about performance over tuning values
##D summary(age_model)
##D 
##D # Get available performance metrics
##D evaluate(age_model)
##D 
##D # Plot training performance on tuning metric (default = RMSE)
##D plot(age_model)
##D 
##D # If new data isn't specifed, get predictions on training data
##D predict(age_model)
##D 
##D ### Faster model training without tuning hyperparameters ###
##D 
##D # Train models at set hyperparameter values by setting tune to FALSE. This is
##D # faster (especially on larger datasets), but produces models with less
##D # predictive power.
##D machine_learn(d$train, patient_id, outcome = diabetes, tune = FALSE)
##D 
##D ### Train models optimizing given metric ###
##D 
##D machine_learn(d$train, patient_id, outcome = diabetes, metric = "PR")
## End(Not run)



