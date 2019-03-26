library(tweet2r)


### Name: tweet2r
### Title: Set up parameters to file streaming and store tweets in a JSON
###   file using Twitter Streaming API .
### Aliases: tweet2r

### ** Examples


## Not run: 
##D 
##D 	#Configuration fo twitter API connection
##D   #this could be avoid and use the default configuration 
##D 	requestURL <- "https://api.twitter.com/oauth/request_token"
##D 	accessURL <- "https://api.twitter.com/oauth/access_token"
##D 	authURL <- "https://api.twitter.com/oauth/authorize"
##D 	consumerKey <- sys.getenv("consumer_key")
##D 	consumerSecret <- sys.getenv("consumer_secret")
##D 
##D 	#definition of the start time and end time
##D 	t_start<-"2015-09-11 9:45:00"
##D 	t_end<-"2015-09-11 23:59:59"
##D 
##D 	#definition of the file prefix
##D 	fileprefix="tweets"
##D 	key=c("keyword1", "keyword2")
##D   
##D   	#definition number of tweets per file
##D  	 number=3000
##D 
##D 	#running the function
##D 	tweet2r(t_start=t_start,t_end=t_end,ntweets=number,keywords=key,fileprefix = fileprefix,
##D 		requestURL,accessURL,authURL,consumerKey,consumerSecret)
##D 
##D 	#running the function using bbox
##D 	#set up a bbox
##D 	bbox=c(-0.1644,39.8485,0.6916,40.0034)
##D 
##D 	tweet2r(t_start=t_start,t_end=t_end,ntweets=number,bbox=bbox,fileprefix = fileprefix,
##D 		requestURL,accessURL,authURL,consumerKey,consumerSecret)
##D 	
## End(Not run)



