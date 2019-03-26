library(AzureRMR)


### Name: create_azure_login
### Title: Login to Azure Resource Manager
### Aliases: create_azure_login get_azure_login delete_azure_login
###   list_azure_logins

### ** Examples

## Not run: 
##D 
##D # without any arguments, this will create a client using your AAD credentials
##D az <- create_azure_login() 
##D 
##D # retrieve the login in subsequent sessions
##D az <- get_azure_login()
##D 
##D # this will create a Resource Manager client for the AAD tenant 'microsoft.onmicrosoft.com',
##D # using the client_credentials method
##D az <- create_azure_login("microsoft", app="{app_id}", password="{password}")
##D 
##D # you can also login using credentials in a json file
##D az <- create_azure_login(config_file="~/creds.json")
##D 
## End(Not run)



