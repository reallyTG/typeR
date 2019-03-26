library(ropensecretsapi)


### Name: GetCandContribData
### Title: Provides the top organizations contributing to specified
###   politician.
### Aliases: GetCandContribData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (cid="N00007360", cycle="2012")
##D  tryCatch(
##D      candContribData <- GetCandContribData (params),
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



