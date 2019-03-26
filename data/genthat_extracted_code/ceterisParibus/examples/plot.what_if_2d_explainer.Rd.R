library(ceterisParibus)


### Name: plot.what_if_2d_explainer
### Title: Plot What If 2D Explanations
### Aliases: plot.what_if_2d_explainer

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
##D wi_rf_2d <- what_if_2d(explainer_rf, observation = new_apartment)
##D wi_rf_2d
##D 
##D plot(wi_rf_2d)
##D plot(wi_rf_2d, add_contour = FALSE)
##D plot(wi_rf_2d, add_observation = FALSE)
##D plot(wi_rf_2d, add_raster = FALSE)
##D 
##D # HR data
##D model <- randomForest(status ~ gender + age + hours + evaluation + salary, data = HR)
##D pred1 <- function(m, x)   predict(m, x, type = "prob")[,1]
##D explainer_rf_fired <- explain(model, data = HR[,1:5],
##D    y = HR$status == "fired",
##D    predict_function = pred1, label = "fired")
##D 
##D new_emp <- HR[1, ]
##D new_emp
##D 
##D wi_rf_2d <- what_if_2d(explainer_rf_fired, observation = new_emp)
##D wi_rf_2d
##D 
##D plot(wi_rf_2d)
## End(Not run)



