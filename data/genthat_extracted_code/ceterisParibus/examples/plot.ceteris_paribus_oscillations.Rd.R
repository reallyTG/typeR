library(ceterisParibus)


### Name: plot.ceteris_paribus_oscillations
### Title: Plot Ceteris Paribus Oscillations
### Aliases: plot.ceteris_paribus_oscillations

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
##D       data = apartmentsTest, y = apartmentsTest$m2.price)
##D 
##D apartment <- apartmentsTest[1:2,]
##D 
##D cp_rf <- ceteris_paribus(explainer_rf, apartment)
##D plot(cp_rf, color = "_ids_")
##D 
##D vips <- calculate_oscillations(cp_rf)
##D vips
##D plot(vips)
## End(Not run)



