library(rapiclient)


### Name: get_operations
### Title: Get operations
### Aliases: get_operations

### ** Examples

## Not run: 
##D # create operation and schema functions
##D api <- get_api(api_url)
##D operations <- get_operations(api)
##D schemas <- get_schemas(api)
##D 
##D # get operations which return content or stop on error
##D operations <- get_operations(api, handle_response = content_or_stop)
##D 
##D # use .headers when operations must send additional heders when sending
##D operations <-
##D   get_operations(api, .headers = c("api-key" = Sys.getenv("SOME_API_KEY"))
## End(Not run)



