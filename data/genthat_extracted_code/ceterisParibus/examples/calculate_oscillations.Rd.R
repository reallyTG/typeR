library(ceterisParibus)


### Name: calculate_oscillations
### Title: Calculate Oscillations for Ceteris Paribus Explainer
### Aliases: calculate_oscillations

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
##D apartment <- apartmentsTest[1,]
##D 
##D cp_rf <- ceteris_paribus(explainer_rf, apartment)
##D calculate_oscillations(cp_rf)
## End(Not run)



