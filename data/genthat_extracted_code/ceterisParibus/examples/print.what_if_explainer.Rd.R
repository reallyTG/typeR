library(ceterisParibus)


### Name: print.what_if_explainer
### Title: Print What If Explainer Summary
### Aliases: print.what_if_explainer

### ** Examples

library("DALEX")
 ## Not run: 
##D library("randomForest")
##D apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
##D                      no.rooms + district, data = apartments)
##D explainer_rf <- explain(apartments_rf_model,
##D                      data = apartmentsTest[,2:6], y = apartmentsTest$m2.price)
##D new_apartment <- apartmentsTest[1, ]
##D new_apartment
## End(Not run)



