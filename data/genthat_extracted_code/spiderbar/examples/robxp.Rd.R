library(spiderbar)


### Name: robxp
### Title: Parse a 'robots.txt' file & create a 'robxp' object
### Aliases: robxp

### ** Examples

imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
               package="spiderbar")), collapse="\n")
rt <- robxp(imdb)



