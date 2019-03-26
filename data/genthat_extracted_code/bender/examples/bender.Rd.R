library(bender)


### Name: Bender
### Title: Bender Client
### Aliases: Bender

### ** Examples

## Not run: 
##D my_optimization_problem <-function(data, hyperparameters) {
##D Do your magic here...
##D return(list(perform=0.3))
##D }
##D 
##D bender = Bender$new("my_bender_mail", "my_secret_password")
##D 
##D bender$set_algo(id="88155b59-aca1-4cb1-898c-25d942c02859")
##D 
##D suggested_hyperparameters <- bender$suggest(metric="accuracy")
##D results <- my_optimization_problem(my_data, suggested_hyperparameters)
##D bender$create_trial(list(accuracy=results.perform), suggested_hyperparameters)
## End(Not run)




