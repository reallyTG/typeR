library(AzureRMR)


### Name: az_rm
### Title: Azure Resource Manager
### Aliases: az_rm
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # start a new Resource Manager session
##D az <- az_rm$new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")
##D 
##D # authenticate with credentials in a file
##D az <- az_rm$new(config_file="creds.json")
##D 
##D # authenticate with device code
##D az <- az_rm$new(tenant="myaadtenant.onmicrosoft.com", app="app_id", auth_type="device_code")
##D 
##D # retrieve a list of subscription objects
##D az$list_subscriptions()
##D 
##D # a specific subscription
##D az$get_subscription("subscription_id")
##D 
## End(Not run)



