library(spiderbar)


### Name: can_fetch
### Title: Test URL paths against a 'robxp' 'robots.txt' object
### Aliases: can_fetch

### ** Examples

gh <- paste0(readLines(system.file("extdata", "github-robots.txt",
             package="spiderbar")), collapse="\n")
gh_rt <- robxp(gh)

can_fetch(gh_rt, "/humans.txt", "*") # TRUE
can_fetch(gh_rt, "/login", "*") # FALSE
can_fetch(gh_rt, "/oembed", "CCBot") # FALSE

can_fetch(gh_rt, c("/humans.txt", "/login", "/oembed"))



