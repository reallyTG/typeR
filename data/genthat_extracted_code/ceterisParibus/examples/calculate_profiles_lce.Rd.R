library(ceterisParibus)


### Name: calculate_profiles_lce
### Title: Calculate Local Conditional Expectation profiles
### Aliases: calculate_profiles_lce

### ** Examples

library("DALEX")
 ## Not run: 
##D library("randomForest")
##D set.seed(59)
##D apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
##D                                       no.rooms + district, data = apartments)
##D explainer_rf <- explain(apartments_rf_model,
##D       data = apartments[,2:6], y = apartments$m2.price)
##D vars <- c("construction.year", "surface", "floor", "no.rooms", "district")
##D variable_splits <- calculate_variable_splits(apartments, vars)
##D new_apartment <- apartments[1, ]
##D 
##D profiles <- calculate_profiles_lce(new_apartment, variable_splits,
##D                                apartments_rf_model, explainer_rf$data)
##D profiles
## End(Not run)



