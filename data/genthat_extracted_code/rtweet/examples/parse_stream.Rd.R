library(rtweet)


### Name: parse_stream
### Title: Converts Twitter stream data (JSON file) into parsed data frame.
### Aliases: parse_stream

### ** Examples

## Not run: 
##D ## run and save stream to JSON file
##D stream_tweets(
##D   "the,a,an,and", timeout = 60,
##D   file_name = "theaanand.json",
##D   parse = FALSE
##D )
##D 
##D ## parse stream file into tibble data frame
##D rt <- parse_stream("theaanand.json")
## End(Not run)



