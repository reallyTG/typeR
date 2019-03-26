library(rtweet)


### Name: stream_tweets
### Title: Collect a live stream of Twitter data.
### Aliases: stream_tweets stream_tweets2

### ** Examples

## Not run: 
##D ## stream tweets mentioning "election" for 90 seconds
##D e <- stream_tweets("election", timeout = 90)
##D 
##D ## data frame where each observation (row) is a different tweet
##D e
##D 
##D ## plot tweet frequency
##D ts_plot(e, "secs")
##D 
##D ## stream tweets mentioning Obama for 30 seconds
##D djt <- stream_tweets("realdonaldtrump", timeout = 30)
##D 
##D ## preview tweets data
##D djt
##D 
##D ## get user IDs of people who mentioned trump
##D usrs <- users_data(djt)
##D 
##D ## lookup users data
##D usrdat <- lookup_users(unique(usrs$user_id))
##D 
##D ## preview users data
##D usrdat
##D 
##D ## store large amount of tweets in files using continuous streams
##D ## by default, stream_tweets() returns a random sample of all tweets
##D ## leave the query field blank for the random sample of all tweets.
##D stream_tweets(
##D   timeout = (60 * 10),
##D   parse = FALSE,
##D   file_name = "tweets1"
##D )
##D stream_tweets(
##D   timeout = (60 * 10),
##D   parse = FALSE,
##D   file_name = "tweets2"
##D )
##D 
##D ## parse tweets at a later time using parse_stream function
##D tw1 <- parse_stream("tweets1.json")
##D tw1
##D 
##D tw2 <- parse_stream("tweets2.json")
##D tw2
##D 
##D ## streaming tweets by specifying lat/long coordinates
##D 
##D ## stream continental US tweets for 5 minutes
##D usa <- stream_tweets(
##D   c(-125, 26, -65, 49),
##D   timeout = 300
##D )
##D 
##D ## use lookup_coords() for a shortcut verson of the above code
##D usa <- stream_tweets(
##D   lookup_coords("usa"),
##D   timeout = 300
##D )
##D 
##D ## stream world tweets for 5 mins, save to JSON file
##D ## shortcut coords note: lookup_coords("world")
##D world.old <- stream_tweets(
##D   c(-180, -90, 180, 90),
##D   timeout = (60 * 5),
##D   parse = FALSE,
##D   file_name = "world-tweets.json"
##D )
##D 
##D ## read in JSON file
##D rtworld <- parse_stream("word-tweets.json")
##D 
##D ## world data set with with lat lng coords variables
##D x <- lat_lng(rtworld)
##D 
## End(Not run)




