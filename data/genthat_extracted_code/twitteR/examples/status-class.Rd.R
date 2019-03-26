library(twitteR)


### Name: status-class
### Title: Class to contain a Twitter status
### Aliases: status-class statusFactory status buildStatus
###   show,status-method as.data.frame,status-method text,status-method
###   favorited,status-method favorited replyToSN,status-method replyToSN
###   created,status-method truncated,status-method truncated
###   replyToSID,status-method replyToSID id,status-method id
###   replyToUID,status-method replyToUID statusSource,status-method
###   statusSource screenName,status-method statusText
###   statusText,status-method retweetCount,status-method retweetCount
###   retweeted,status-method retweeted [[,twitterObjList-method
###   as.data.frame,twitterObj-method show,twitterObjList-method
### Keywords: classes

### ** Examples

   ## Not run: 
##D      st <- statusFactory$new(screenName="test", text="test message")
##D      st$getScreenName()
##D      st$getText()
##D 
##D      ## Assume 'json' is the return from a Twitter call
##D      st <- statusFactory$new(json)
##D      st$getScreenName()
##D    
## End(Not run)
   



