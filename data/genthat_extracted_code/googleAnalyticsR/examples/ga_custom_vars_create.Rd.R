library(googleAnalyticsR)


### Name: ga_custom_vars_create
### Title: Create a custom dimension
### Aliases: ga_custom_vars_create

### ** Examples


## Not run: 
##D library(googleAnalyticsR)
##D ga_auth()
##D 
##D # create custom var
##D ga_custom_vars_create("my_custom_dim",
##D                       index = 15,
##D                       accountId = 54019251,
##D                       webPropertyId = "UA-54019251-4",
##D                       scope = "HIT",
##D                       active = FALSE)
##D 
##D # view custom dimension in list
##D ga_custom_vars_list(54019251, webPropertyId = "UA-54019251-4", type = "customDimensions")
##D 
## End(Not run)



