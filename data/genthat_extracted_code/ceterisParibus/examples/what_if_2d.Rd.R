library(ceterisParibus)


### Name: what_if_2d
### Title: What-If 2D Plot
### Aliases: what_if_2d

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
##D wi_rf_2d <- what_if_2d(explainer_rf, observation = new_apartment,
##D          selected_variables = c("surface", "floor", "no.rooms"))
##D wi_rf_2d
##D plot(wi_rf_2d)
## End(Not run)



