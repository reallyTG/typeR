library(ropensecretsapi)


### Name: GetCandSectorData
### Title: Provides the top industries contributing to a specified
###   politician.
### Aliases: GetCandSectorData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (cid="N00007360", cycle="2012")
##D  tryCatch(
##D      candSectorData <- GetCandSectorData (params),
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



