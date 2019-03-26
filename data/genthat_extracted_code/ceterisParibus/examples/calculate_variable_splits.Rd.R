library(ceterisParibus)


### Name: calculate_variable_splits
### Title: Calculate Split Points for Selected Variables
### Aliases: calculate_variable_splits

### ** Examples

library("DALEX")
 ## Not run: 
##D library("randomForest")
##D set.seed(59)
##D apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
##D                                       no.rooms + district, data = apartments)
##D vars <- c("construction.year", "surface", "floor", "no.rooms", "district")
##D calculate_variable_splits(apartments, vars)
## End(Not run)



