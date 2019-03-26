library(ceterisParibus)


### Name: calculate_profiles
### Title: Calculate Ceteris Paribus Profiles
### Aliases: calculate_profiles

### ** Examples

library("DALEX")
 ## Not run: 
##D library("randomForest")
##D set.seed(59)
##D apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
##D                                       no.rooms + district, data = apartments)
##D vars <- c("construction.year", "surface", "floor", "no.rooms", "district")
##D variable_splits <- calculate_variable_splits(apartments, vars)
##D new_apartment <- apartmentsTest[1:10, ]
##D profiles <- calculate_profiles(new_apartment, variable_splits,
##D                                apartments_rf_model)
##D profiles
##D 
##D # only subset of observations
##D small_apartments <- select_sample(apartmentsTest, n = 10)
##D small_apartments
##D small_profiles <- calculate_profiles(small_apartments, variable_splits,
##D                                apartments_rf_model)
##D small_profiles
##D 
##D # neighbors for a selected observation
##D new_apartment <- apartments[1, 2:6]
##D small_apartments <- select_neighbours(apartmentsTest, new_apartment, n = 10)
##D small_apartments
##D small_profiles <- calculate_profiles(small_apartments, variable_splits,
##D                                apartments_rf_model)
##D new_apartment
##D small_profiles
## End(Not run)



