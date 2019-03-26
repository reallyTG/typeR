library(dexter)


### Name: get_responses
### Title: Selecting data
### Aliases: get_responses

### ** Examples

## No test: 
## Not run: 
##D # goal: fit the extended nominal response model using only persons 
##D # without any missing responses
##D library(dplyr)
##D 
##D # the following would not work since it will omit only the missing 
##D # responses, not the persons; which is not what we want in this case
##D wrong = fit_enorm(db, response != 'NA')
##D 
##D # to select on an aggregate level, we need to gather the data and 
##D # manipulate it ourselves
##D data = get_responses(db, 
##D    columns=c('person_id','item_id','item_score','response')) %>%
##D    group_by(person_id) %>%
##D    mutate(any_missing = any(response=='NA')) %>%
##D    filter(!any_missing)
##D 
##D correct = fit_enorm(data)
##D 
## End(Not run)## End(No test)



