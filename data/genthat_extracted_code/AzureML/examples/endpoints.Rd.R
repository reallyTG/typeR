library(AzureML)


### Name: endpoints
### Title: List AzureML Web Service Endpoints
### Aliases: endpoints getEndpoints

### ** Examples

## Not run: 
##D workspace_id <- ""          # Your AzureML workspace id
##D authorization_token <- ""   # Your AsureML authorization token
##D 
##D ws <- workspace(
##D   id = workspace_id,
##D   auth = authorization_token
##D )
##D 
##D s <- services(ws)
##D endpoints(ws, s$Id[1])
##D 
##D # Note that you can alternatively just use the entire row that
##D # describes the service.
##D endpoints(ws, s[1,])
##D 
##D # Equivalent:
##D getEndpoints(ws, s$Id[1])
## End(Not run)



