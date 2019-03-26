library(ceterisParibus)


### Name: print.ceteris_paribus_explainer
### Title: Print Ceteris Paribus Explainer Summary
### Aliases: print.ceteris_paribus_explainer

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
##D apartments_small <- select_sample(apartmentsTest, 10)
##D 
##D cp_rf <- ceteris_paribus(explainer_rf, apartments_small)
##D cp_rf
## End(Not run)



