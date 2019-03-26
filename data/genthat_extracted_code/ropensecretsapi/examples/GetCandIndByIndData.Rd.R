library(ropensecretsapi)


### Name: GetCandIndByIndData
### Title: Provides total contributed to specified candidate from specified
###   industry for specified cycle.
### Aliases: GetCandIndByIndData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (cid="N00007360", cycle="2012", ind="K02")
##D  tryCatch(
##D      candIndByIndData <- GetCandIndByIndData (params),
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



