library(qdapRegex)


### Name: rm_url
### Title: Remove/Replace/Extract URLs
### Aliases: rm_url rm_twitter_url ex_url ex_twitter_url
### Keywords: ftp http t.co url www

### ** Examples

x <- " I like www.talkstats.com and http://stackoverflow.com"
rm_url(x)
rm_url(x, replacement = '<a href="\\1" target="_blank">\\1</a>')
ex_url(x)

ex_url(x, pattern = "@rm_url2")
ex_url(x, pattern = "@rm_url3")

## Remove Twitter Short URL
x <- c("download file from http://example.com", 
         "this is the link to my website http://example.com", 
         "go to http://example.com from more info.",
         "Another url ftp://www.example.com",
         "And https://www.example.net",
         "twitter type: t.co/N1kq0F26tG",
         "still another one https://t.co/N1kq0F26tG :-)")

rm_twitter_url(x)
ex_twitter_url(x)

## Combine removing Twitter URLs and standard URLs
rm_twitter_n_url <- rm_(pattern=pastex("@rm_twitter_url", "@rm_url"))
rm_twitter_n_url(x)
rm_twitter_n_url(x, extract=TRUE)



