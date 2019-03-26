library(ceterisParibus)


### Name: plot_interactive
### Title: Plots Interactive What-If Explanations
### Aliases: plot_interactive plot_interactive.what_if_explainer
###   plot_interactive plot_interactive plot_interactive.default

### ** Examples

library("DALEX")
 ## Not run: 
##D library("ggiraph")
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
##D plot_interactive(wi_rf, split = "variables", color = "variables")
## End(Not run)



