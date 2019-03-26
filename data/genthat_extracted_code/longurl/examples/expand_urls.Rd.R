library(longurl)


### Name: expand_urls
### Title: Expand a vector of (short) URLs using
### Aliases: expand_urls

### ** Examples

test_urls <- c("http://t.co/D4C7aWYIiA",
               "1.usa.gov/1J6GNoW",
               "ift.tt/1L2Llfr")
big_urls <- expand_urls(test_urls)
head(big_urls)



