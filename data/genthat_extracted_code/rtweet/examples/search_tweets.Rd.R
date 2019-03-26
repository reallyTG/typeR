library(rtweet)


### Name: search_tweets
### Title: Get tweets data on statuses identified via search query.
### Aliases: search_tweets search_tweets2

### ** Examples


## Not run: 
##D 
##D ## search for 1000 tweets mentioning Hillary Clinton
##D hrc <- search_tweets(q = "hillaryclinton", n = 1000)
##D 
##D ## data frame where each observation (row) is a different tweet
##D hrc
##D 
##D ## users data also retrieved. can access it via users_data()
##D users_data(hrc)
##D 
##D ## search for 1000 tweets in English
##D djt <- search_tweets(q = "realdonaldtrump", n = 1000, lang = "en")
##D 
##D ## preview tweets data
##D djt
##D 
##D ## preview users data
##D users_data(djt)
##D 
##D ## exclude retweets
##D rt <- search_tweets("rstats", n = 500, include_rts = FALSE)
##D 
##D ## perform search for lots of tweets
##D rt <- search_tweets(
##D   "trump OR president OR potus", n = 100000,
##D   retryonratelimit = TRUE
##D )
##D 
##D ## plot time series of tweets frequency
##D ts_plot(rt, by = "mins")
##D 
##D ## make multiple independent search queries
##D ds <- Map(
##D   "search_tweets",
##D   c("\"data science\"", "rstats OR python"),
##D   n = 1000
##D )
##D 
##D ## bind by row whilst preserving users data
##D ds <- do_call_rbind(ds)
##D 
##D ## preview tweets data
##D ds
##D 
##D ## preview users data
##D users_data(ds)
##D 
## End(Not run)


## Not run: 
##D 
##D ## search using multilple queries
##D st2 <- search_tweets2(
##D   c("\"data science\"", "rstats OR python"),
##D   n = 500
##D )
##D 
##D ## preview tweets data
##D st2
##D 
##D ## preview users data
##D users_data(st2)
##D 
##D ## check breakdown of results by search query
##D table(st2$query)
##D 
## End(Not run)




