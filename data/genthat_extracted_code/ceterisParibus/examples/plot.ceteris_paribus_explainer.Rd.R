library(ceterisParibus)


### Name: plot.ceteris_paribus_explainer
### Title: Plot Ceteris Paribus Explanations
### Aliases: plot.ceteris_paribus_explainer

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
##D apartments_small <- apartmentsTest[1:20,]
##D apartments_small_1 <- apartmentsTest[1,]
##D apartments_small_2 <- select_sample(apartmentsTest, n = 20)
##D apartments_small_3 <- select_neighbours(apartmentsTest, apartments_small_1, n = 20)
##D 
##D cp_rf <- ceteris_paribus(explainer_rf, apartments_small)
##D cp_rf_1 <- ceteris_paribus(explainer_rf, apartments_small_1)
##D cp_rf_2 <- ceteris_paribus(explainer_rf, apartments_small_2)
##D cp_rf_3 <- ceteris_paribus(explainer_rf, apartments_small_3)
##D cp_rf
##D 
##D cp_rf_y <- ceteris_paribus(explainer_rf, apartments_small, y = apartments_small$m2.price)
##D cp_rf_y1 <- ceteris_paribus(explainer_rf, apartments_small_1, y = apartments_small_1$m2.price)
##D cp_rf_y2 <- ceteris_paribus(explainer_rf, apartments_small_2, y = apartments_small_2$m2.price)
##D cp_rf_y3 <- ceteris_paribus(explainer_rf, apartments_small_3, y = apartments_small_3$m2.price)
##D 
##D plot(cp_rf_y, show_profiles = TRUE, show_observations = TRUE,
##D                show_residuals = TRUE, color = "black",
##D                alpha = 0.3, alpha_points = 1, alpha_residuals = 0.5,
##D                size_points = 2, size_rugs = 0.5)
##D 
##D plot(cp_rf_y, show_profiles = TRUE, show_observations = TRUE,
##D                show_residuals = TRUE, color = "black",
##D                selected_variables = c("construction.year", "surface"),
##D                alpha = 0.3, alpha_points = 1, alpha_residuals = 0.5,
##D                size_points = 2, size_rugs = 0.5)
##D 
##D plot(cp_rf_y1, show_profiles = TRUE, show_observations = TRUE, show_rugs = TRUE,
##D                show_residuals = TRUE, alpha = 0.5, size_points = 3,
##D                alpha_points = 1, size_rugs = 0.5)
##D 
##D plot(cp_rf_y2, show_profiles = TRUE, show_observations = TRUE, show_rugs = TRUE,
##D                alpha = 0.2, alpha_points = 1, size_rugs = 0.5)
##D 
##D plot(cp_rf_y3, show_profiles = TRUE, show_rugs = TRUE,
##D                show_residuals = TRUE, alpha = 0.2, color_residuals = "orange", size_rugs = 0.5)
##D 
##D plot(cp_rf_y, show_profiles = TRUE, show_observations = TRUE, show_rugs = TRUE, size_rugs = 0.5,
##D                show_residuals = TRUE, alpha = 0.5, color = "surface", as.gg = TRUE) +
##D                scale_color_gradient(low = "darkblue", high = "darkred")
##D 
##D plot(cp_rf_y1, show_profiles = TRUE, show_observations = TRUE, show_rugs = TRUE,
##D                show_residuals = TRUE, alpha = 0.5, color = "surface", size_points = 3)
##D 
##D plot(cp_rf_y2, show_profiles = TRUE, show_observations = TRUE, show_rugs = TRUE,
##D                size = 0.5, alpha = 0.5, color = "surface")
##D 
##D plot(cp_rf_y, show_profiles = TRUE, show_rugs = TRUE, size_rugs = 0.5,
##D                show_residuals = FALSE, aggregate_profiles = mean, color = "darkblue")
## End(Not run)



