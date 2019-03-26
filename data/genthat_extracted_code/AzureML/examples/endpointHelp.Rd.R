library(AzureML)


### Name: endpointHelp
### Title: Display AzureML Web Service Endpoint Help Screens.
### Aliases: endpointHelp

### ** Examples

## Not run: 
##D ws <- workspace()
##D 
##D s <- services(ws)
##D e <- endpoints(ws, s[1,])
##D endpointHelp(e)
##D 
##D Particularly useful way to see expected service input and output:
##D endpointHelp(e)$definitions
##D 
## End(Not run)



