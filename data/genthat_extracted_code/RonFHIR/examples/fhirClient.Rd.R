library(RonFHIR)


### Name: fhirClient
### Title: fhirClient
### Aliases: fhirClient

### ** Examples

## Not run: 
##D # Setting up a fhirClient
##D client <- fhirClient$new("https://vonk.fire.ly")
##D # Read
##D client$read("Patient/example")
##D 
##D # Search
##D bundle <- client$search("Patient", c("name=Peter", "address-postalcode=3999"))
##D 
##D while(!is.null(bundle)){
##D    # Do something useful
##D    bundle <- client$continue(bundle)
##D }
## End(Not run)
## Not run: 
##D # Using Oauth 2.0
##D client <- fhirClient$new("https://vonk.fire.ly")
##D 
##D # Retrieving a token
##D 
##D client_id <- "id"
##D client_secret <- "secret"
##D app_name <- "TestApp"
##D scopes <- c("patient/*.read")
##D 
##D app <- httr::oauth_app(appname = app_name, client_id, client_secret)
##D oauth_endpoint <- httr::oauth_endpoint(
##D                   authorize = paste(client$authUrl, "?aud=", client$endpoint, sep=""),
##D                   access = client$tokenUrl)
##D   
##D token <- httr::oauth2.0_token(endpoint = oauth_endpoint, app = app, scope = scopes)
##D 
##D # Set a token and read a patient resource
##D client$setToken(token$credentials$access_token)
##D 
##D client$read("Patient/example")
##D 
##D # Token refresh
##D token <- token$refresh()
##D 
##D client$setToken(token$credentials$access_token)
##D 
## End(Not run)




