library(crqanlp)


### Name: get_text_series
### Title: Get a text series
### Aliases: get_text_series
### Keywords: misc

### ** Examples


## from a literal string
rsrc = "here is a raw raw raw string, literally"
ts = get_text_series(rsrc,typ='string')
print(ts)

## from tibble
library(gutenbergr)
## let's get Alice's Adventures in Wonderland by Carroll
# gutenberg_works(author == "Carroll, Lewis") 
rsrc = gutenberg_download(11) ## take the text
ts = get_text_series(rsrc, typ = "tibble", removeStopwords = TRUE)
print(ts[1:10])

## from URL
rsrc = "http://www.omegahat.net"
ts = get_text_series(rsrc, typ = "url")
print(ts[1:10])





