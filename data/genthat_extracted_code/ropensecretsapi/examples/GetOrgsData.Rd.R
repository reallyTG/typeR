library(ropensecretsapi)


### Name: GetOrgsData
### Title: Provides organization data.
### Aliases: GetOrgsData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (org="Microsoft")
##D  tryCatch(
##D      orgsData <- GetOrgsData (params),
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



