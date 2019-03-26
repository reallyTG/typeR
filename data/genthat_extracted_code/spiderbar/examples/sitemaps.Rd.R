library(spiderbar)


### Name: sitemaps
### Title: Retrieve a character vector of sitemaps from a parsed robots.txt
###   object
### Aliases: sitemaps

### ** Examples

imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
               package="rep")), collapse="\n")
rt <- robxp(imdb)
sitemaps(rt)



