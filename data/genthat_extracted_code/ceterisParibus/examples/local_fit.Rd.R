library(ceterisParibus)


### Name: local_fit
### Title: Local Fit / Wangkardu Explanations
### Aliases: local_fit

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
##D       data = apartmentsTest[,2:6], y = apartmentsTest$m2.price)
##D 
##D new_apartment <- apartmentsTest[1, ]
##D new_apartment
##D 
##D cr_rf <- local_fit(explainer_rf, observation = new_apartment,
##D     select_points = 0.002, selected_variable = "surface")
##D cr_rf
## End(Not run)



