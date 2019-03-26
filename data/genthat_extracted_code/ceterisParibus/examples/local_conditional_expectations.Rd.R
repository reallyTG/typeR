library(ceterisParibus)


### Name: local_conditional_expectations
### Title: Local Conditional Expectation Explainer
### Aliases: local_conditional_expectations

### ** Examples

library("DALEX")
 ## Not run: 
##D library("randomForest")
##D set.seed(59)
##D 
##D apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
##D       no.rooms + district, data = apartments)
##D 
##D explainer_rf <- explain(apartments_rf_model,
##D       data = apartments[,2:6], y = apartments$m2.price)
##D 
##D new_apartment <- apartments[1, ]
##D 
##D cp_rf <- ceteris_paribus(explainer_rf, new_apartment)
##D lce_rf <- local_conditional_expectations(explainer_rf, new_apartment)
##D lce_rf
##D 
##D lce_rf <- local_conditional_expectations(explainer_rf, new_apartment, y = new_apartment$m2.price)
##D lce_rf
##D 
##D # Plot LCE
##D sel_vars <- c("surface", "no.rooms")
##D plot(lce_rf, selected_variables = sel_vars)
##D 
##D # Compare ceteris paribus profiles with LCE profiles 
##D plot(cp_rf, selected_variables = sel_vars) + 
##D    ceteris_paribus_layer(lce_rf, selected_variables = sel_vars, color = "red")
##D 
## End(Not run)



