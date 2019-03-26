library(twitteR)


### Name: directMessage-class
### Title: Class "directMessage": A class to represent Twitter Direct
###   Messages
### Aliases: directMessage-class directMessage dmFactory
###   show,directMessage-method
### Keywords: classes

### ** Examples

  ## Not run: 
##D     dm <- dmFactory$new(text='foo', recipientSN='blah')
##D     dm$getText()
##D   
##D     ## assume 'json' is the return from a Twitter call
##D     dm <- dmFactory$new(json)
##D     dm$getSenderID()
##D   
## End(Not run)



