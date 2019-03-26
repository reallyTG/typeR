library(twitteR)


### Name: user-class
### Title: A container object to model Twitter users
### Aliases: userFactory user-class user buildUser screenName
###   screenName,user-method show,user-method as.data.frame,user-method
###   description,user-method statusesCount,user-method statusesCount
###   created description favoritesCount followersCount friendsCount
###   followersCount,user-method favoritesCount,user-method
###   friendsCount,user-method userURL,user-method userURL name,user-method
###   name created,user-method tweetCount,user-method tweetCount
###   protected,user-method protected verified,user-method verified
###   location,user-method location id,user-method lastStatus,user-method
###   lastStatus listedCount,user-method listedCount
###   followRequestSent,user-method followRequestSent profileImageUrl
###   profileImageUrl,user-method
### Keywords: classes

### ** Examples

   ## This example is run, but likely not how you want to do things
   us <- userFactory$new(screenName="test", name="Joe Smith")
   us$getScreenName()
   us$getName()

   ## Not run: 
##D      ## Assume 'json' is the return from a Twitter call
##D      us <- userFactory$new(json)
##D      us$getScreenName()
##D    
## End(Not run)



