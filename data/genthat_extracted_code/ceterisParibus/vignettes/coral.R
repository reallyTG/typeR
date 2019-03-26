## ---- warning=FALSE, message=FALSE---------------------------------------
library("DALEX")
library("randomForest")
library("ceterisParibus")
set.seed(59)

apartments_lm_model <- lm(m2.price ~ construction.year + surface + floor + 
                            no.rooms + district, data = apartments)

apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor + 
                                      no.rooms + district, data = apartments)

explainer_rf <- explain(apartments_rf_model, 
                        data = apartmentsTest[,2:6], y = apartmentsTest$m2.price)
explainer_lm <- explain(apartments_lm_model, 
                        data = apartmentsTest[,2:6], y = apartmentsTest$m2.price)

## ---- fig.width=7, fig.height=7------------------------------------------
new_apartment <- apartmentsTest[1, ]
new_apartment

## ---- fig.width=7, fig.height=7------------------------------------------
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, plot_residuals = FALSE)
plot(cr_rf)

## ---- fig.width=7, fig.height=7------------------------------------------
new_apartment <- apartmentsTest[10, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, plot_residuals = FALSE)
plot(cr_rf)
new_apartment <- apartmentsTest[302, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
 plot(cr_rf)
new_apartment <- apartmentsTest[720, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf)

## ---- fig.width=7, fig.height=7------------------------------------------
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, plot_residuals = FALSE, palette = "wangkardu")
plot(cr_rf, palette = "wangkardu")

new_apartment <- apartmentsTest[10, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, plot_residuals = FALSE, palette = "wangkardu")
plot(cr_rf, palette = "wangkardu")
new_apartment <- apartmentsTest[302, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, palette = "wangkardu")
new_apartment <- apartmentsTest[720, ]
cr_rf <- local_fit(explainer_rf, observation = new_apartment, 
                   select_points = 0.002, selected_variable = "surface")
plot(cr_rf, palette = "wangkardu")

