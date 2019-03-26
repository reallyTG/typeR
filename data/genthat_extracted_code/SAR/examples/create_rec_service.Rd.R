library(SAR)


### Name: create_rec_service
### Title: Create Azure recommender service
### Aliases: create_rec_service

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # create a new recommender service
##D rg$create_rec_service("myrec", hosting_plan="S2")
##D 
## End(Not run)



