library(ceterisParibus)


### Name: plot.what_if_explainer
### Title: Plot What If Explanations
### Aliases: plot.what_if_explainer

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
##D wi_rf <- what_if(explainer_rf, observation = new_apartment)
##D wi_rf
##D 
##D plot(wi_rf, split = "variables", color = "variables")
##D plot(wi_rf)
## End(Not run)



