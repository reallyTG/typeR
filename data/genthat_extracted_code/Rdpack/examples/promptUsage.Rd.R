library(Rdpack)


### Name: promptUsage
### Title: Generate usage text for functions and methods
### Aliases: promptUsage get_usage
### Keywords: documentation Rd

### ** Examples

u <- get_usage(lm)    # a long usage text
cat(u)

# if there are additional arguments in S3 methods,
# use names of the functions, not the objects, e.g.
get_usage("droplevels", S3class = "data.frame")
get_usage(name = "droplevels", S3class = "data.frame")
# (both give "\method{droplevels}{data.frame}(x, except = NULL, ...)")

# but this gives the args of the generic:  "\method{droplevels}{data.frame}(x, ...)"
get_usage(droplevels, S3class = "data.frame")

## a list containing some functions
summaries <- list(xbar = function(x) mean(x), rho = function(x, y) cor(x,y))
get_usage(summaries$xbar, name = "xbar")
get_usage(summaries$rho, name = "rho")

## functions in an environment
esummaries <- list2env(summaries)
get_usage(esummaries$xbar, name = "xbar")
get_usage(esummaries$rho, name = "rho")



