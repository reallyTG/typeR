library(ropensecretsapi)


### Name: GetLegislatorsData
### Title: Provides a list of legislators and associated attributes.
### Aliases: GetLegislatorsData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (id="NJ")
##D  tryCatch(
##D      legislatorsData <- GetLegislatorsData (params),
##D      error =
##D          function (e) {
##D              print (
##D                  paste (
##D                      "An exception was thrown -- details follow: ",
##D                      e,
##D                      sep=""
##D                  )
##D              )
##D          }
##D      )
##D  
## End(Not run)



