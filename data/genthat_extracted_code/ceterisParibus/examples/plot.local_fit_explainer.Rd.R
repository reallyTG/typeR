library(ceterisParibus)


### Name: plot.local_fit_explainer
### Title: Local Fit Plots / Wangkardu Explanations
### Aliases: plot.local_fit_explainer

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
##D plot(cr_rf, plot_residuals = FALSE)
##D plot(cr_rf)
##D 
##D cr_rf <- local_fit(explainer_rf, observation = new_apartment,
##D           select_points = 0.002, selected_variable = "surface")
##D plot(cr_rf, plot_residuals = FALSE, palette = "wangkardu")
##D plot(cr_rf, palette = "wangkardu")
##D 
##D new_apartment <- apartmentsTest[10, ]
##D cr_rf <- local_fit(explainer_rf, observation = new_apartment,
##D           select_points = 0.002, selected_variable = "surface")
##D plot(cr_rf, plot_residuals = FALSE)
##D plot(cr_rf)
##D 
##D new_apartment <- apartmentsTest[302, ]
##D cr_rf <- local_fit(explainer_rf, observation = new_apartment,
##D           select_points = 0.002, selected_variable = "surface")
##D plot(cr_rf, plot_residuals = FALSE)
##D plot(cr_rf)
##D 
##D new_apartment <- apartmentsTest[720, ]
##D cr_rf <- local_fit(explainer_rf, observation = new_apartment,
##D          select_points = 0.002, selected_variable = "surface")
##D plot(cr_rf, plot_residuals = FALSE)
##D plot(cr_rf)
## End(Not run)



