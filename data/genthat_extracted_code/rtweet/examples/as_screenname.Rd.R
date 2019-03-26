library(rtweet)


### Name: as_screenname
### Title: Coerces user identifier(s) to be evaluated as a screen name(s).
### Aliases: as_screenname as_userid

### ** Examples

## Not run: 
##D ## get friends list for user with the handle "1234"
##D get_friends(as_screenname("1234"))
##D 
##D ## as_screenname coerces all elements to class "screen_name"
##D sns <- as_screenname(c("kearneymw", "1234", "jack"))
##D class(sns)
##D 
##D ## print will display user class type
##D sns
##D 
##D ## BAD: combine user id and screen name using c()
##D users <- c(as_userid("2973406683"), as_screenname("1234"))
##D class(users)
##D 
##D ## GOOD: combine user id and screen name using list()
##D users <- list(as_userid("2973406683"), as_screenname("1234"))
##D users
##D 
##D ## get friend networks for each user
##D get_friends(users)
##D 
## End(Not run)



