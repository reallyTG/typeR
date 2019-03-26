library(ceterisParibus)


### Name: ceteris_paribus_layer
### Title: Add Layer to the Ceteris Paribus Plot
### Aliases: ceteris_paribus_layer

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
##D apartments_small_1 <- apartmentsTest[1,]
##D apartments_small_2 <- select_sample(apartmentsTest, n = 20)
##D apartments_small_3 <- select_neighbours(apartmentsTest, apartments_small_1, n = 20)
##D 
##D cp_rf_y1 <- ceteris_paribus(explainer_rf, apartments_small_1, y = apartments_small_1$m2.price)
##D cp_rf_y2 <- ceteris_paribus(explainer_rf, apartments_small_2, y = apartments_small_2$m2.price)
##D cp_rf_y3 <- ceteris_paribus(explainer_rf, apartments_small_3, y = apartments_small_3$m2.price)
##D 
##D tmp <- plot(cp_rf_y3, show_profiles = TRUE, show_observations = TRUE,
##D                show_residuals = TRUE, color = "black",
##D                alpha = 0.2, color_residuals = "darkred",
##D                selected_variables = c("construction.year", "surface"))
##D 
##D tmp <- plot(cp_rf_y3, show_profiles = TRUE, show_observations = TRUE,
##D                show_residuals = TRUE, color = "black",
##D                alpha = 0.2, color_residuals = "darkred")
##D 
##D tmp
##D 
##D tmp +
##D  ceteris_paribus_layer(cp_rf_y2, show_profiles = TRUE, show_observations = TRUE,
##D                alpha = 0.2, color = "darkblue")
##D 
##D tmp +
##D   ceteris_paribus_layer(cp_rf_y2, show_profiles = TRUE, show_observations = TRUE,
##D                alpha = 0.2, color = "darkblue") +
##D   ceteris_paribus_layer(cp_rf_y2, show_profiles = TRUE, show_observations = FALSE,
##D                alpha = 1, size = 2, color = "blue", aggregate_profiles = mean) +
##D   ceteris_paribus_layer(cp_rf_y1, show_profiles = TRUE, show_observations = FALSE,
##D                alpha = 1, size = 2, color = "red", aggregate_profiles = mean)
## End(Not run)



