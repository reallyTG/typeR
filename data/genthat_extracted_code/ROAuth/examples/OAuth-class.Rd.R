library(ROAuth)


### Name: OAuth-class
### Title: Class "OAuth": A class to manage OAuth authentication
### Aliases: OAuth-class ROAuth OAuth OAuthFactory
### Keywords: classes

### ** Examples

   ## This example uses a test case from liboauth and the
   ## keys are already pre-signed.  This is an example of
   ## one of the few times \code{needsVerifier} would be \code{FALSE}.
  ## Not run: 
##D    reqURL <- "http://term.ie/oauth/example/request_token.php"
##D    accessURL <- "http://term.ie/oauth/example/access_token.php"
##D    authURL <- "NORMALLY YOU NEED THIS"
##D    cKey <- "key"
##D    cSecret <- "secret"
##D    testURL <- "http://term.ie/oauth/example/echo_api.php?method=foo bar"
##D 
##D    credentials <- OAuthFactory$new(consumerKey=cKey,
##D                                    consumerSecret=cSecret,
##D                                    requestURL=reqURL,
##D 				   accessURL=accessURL,
##D 				   authURL=authURL,
##D                                    needsVerifier=FALSE)
##D    credentials$handshake()
##D    ## the GET isn't strictly necessary as that's the default
##D    credentials$OAuthRequest(testURL, "GET")
##D   
## End(Not run)



