library(AzureAuth)


### Name: get_azure_token
### Title: Manage Azure Active Directory OAuth 2.0 tokens
### Aliases: get_azure_token delete_azure_token clean_token_directory
###   list_azure_tokens token_hash is_azure_token is_azure_v1_token
###   is_azure_v2_token

### ** Examples

## Not run: 
##D 
##D # authenticate with Azure Resource Manager:
##D # no user credentials are supplied, so this will use the authorization_code
##D # method if httpuv is installed, and device_code if not
##D get_azure_token("https://management.azure.com/", tenant="mytenant", app="app_id")
##D 
##D # you can force a specific authentication method with the auth_type argument
##D get_azure_token("https://management.azure.com/", tenant="mytenant", app="app_id",
##D     auth_type="device_code")
##D 
##D # to default to the client_credentials method, supply the app secret as the password
##D get_azure_token("https://management.azure.com/", tenant="mytenant", app="app_id",
##D     password="app_secret")
##D 
##D # authenticate to your resource with the resource_owner method: provide your username and password
##D get_azure_token(resource="https://myresource/", tenant="mytenant", app="app_id",
##D     username="user", password="abcdefg")
##D 
##D 
##D # use a different redirect URI to the default localhost:1410
##D get_azure_token("https://management.azure.com/", tenant="mytenant", app="app_id",
##D     authorize_args=list(redirect_uri="http://127.255.10.1:8000"))
##D 
##D 
##D # request an AAD v1.0 token for Resource Manager (the default)
##D token1 <- get_azure_token("https://management.azure.com/", "mytenant", "app_id")
##D 
##D # same request to AAD v2.0, along with a refresh token
##D token2 <- get_azure_token(c("https://management.azure.com/.default", "offline_access"),
##D     "mytenant", "app_id", version=2)
##D 
##D 
##D # list saved tokens
##D list_azure_tokens()
##D 
##D # delete a saved token from disk
##D delete_azure_token(resource="https://myresource/", tenant="mytenant", app="app_id",
##D     username="user", password="abcdefg")
##D 
##D # delete a saved token by specifying its MD5 hash
##D delete_azure_token(hash="7ea491716e5b10a77a673106f3f53bfd")
##D 
## End(Not run)



