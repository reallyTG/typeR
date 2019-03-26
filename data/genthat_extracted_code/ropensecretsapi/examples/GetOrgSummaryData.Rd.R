library(ropensecretsapi)


### Name: GetOrgSummaryData
### Title: Provides organization summary data.
### Aliases: GetOrgSummaryData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (id="123")
##D  tryCatch(
##D      orgSummaryData <- GetOrgSummaryData (params),
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
## End(Not run)



