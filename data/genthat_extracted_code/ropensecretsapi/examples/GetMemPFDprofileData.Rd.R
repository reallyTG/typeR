library(ropensecretsapi)


### Name: GetMemPFDprofileData
### Title: Returns PFD information for a member of Congress.
### Aliases: GetMemPFDprofileData

### ** Examples

## Not run: 
##D  SetAPIKey ("ENTER YOUR PRIVATE API KEY HERE.")
##D  params <- list (year="2010", cid="N00007360")
##D  tryCatch(
##D      memPFDprofileData <- GetMemPFDprofileData (params),
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



