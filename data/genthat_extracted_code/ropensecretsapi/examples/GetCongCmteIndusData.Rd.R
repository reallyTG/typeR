library(ropensecretsapi)


### Name: GetCongCmteIndusData
### Title: Provides summary fundraising information for a specific
###   committee, industry and congress number.
### Aliases: GetCongCmteIndusData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (congno="112", indus="F10", cmte="HARM")
##D  tryCatch(
##D      congCmteIndusData <- GetCongCmteIndusData (params),
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



