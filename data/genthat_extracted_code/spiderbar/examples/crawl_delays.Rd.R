library(spiderbar)


### Name: crawl_delays
### Title: Retrive all agent crawl delay values in a 'robxp' 'robots.txt'
###   object
### Aliases: crawl_delays

### ** Examples

gh <- paste0(readLines(system.file("extdata", "github-robots.txt",
             package="spiderbar")), collapse="\n")
gh_rt <- robxp(gh)
crawl_delays(gh_rt)

imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
               package="spiderbar")), collapse="\n")
imdb_rt <- robxp(imdb)
crawl_delays(imdb_rt)



