library(notifyR)


### Name: send_push
### Title: Send push notifications to your smartphone via pushover.net
### Aliases: send_push
### Keywords: IO connection misc

### ** Examples

## Not run: 
##D ## First get your user key at http://pushover.net
##D ##
##D 
##D userkey <- "[YOUR PUSHOVER USER KEY]" #Define user key
##D 
##D send_push(userkey,"Simulation finished")
##D 
##D send_push(userkey,message="finished.",title="World Simulation",url="http://www.myRresults.com/",url_title="View Results online.",priority=TRUE)
##D 
##D send_push(userkey,"Cool Date",timestamp=as.POSIXct("1987-02-24 15:00:00", tz="CET"))
##D 
##D send_push(userkey,"Send notification only to my favorite Smartphone",device="favorite")
##D 
##D 
##D 
## End(Not run)



