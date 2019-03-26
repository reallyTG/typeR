library(ropensecretsapi)


### Name: GetCandSummaryData
### Title: Provides summary fundraising information for a specified
###   politician.
### Aliases: GetCandSummaryData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (cid="N00007360", cycle="2012")
##D  tryCatch(
##D      candSummaryData <- GetCandSummaryData (params),
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



