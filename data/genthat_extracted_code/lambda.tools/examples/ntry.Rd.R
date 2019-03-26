library(lambda.tools)


### Name: ntry
### Title: Call a function until it succeeds
### Aliases: ntry

### ** Examples

## Not run: 
##D fn <- function(i) {
##D   x <- sample(1:4, 1)
##D   flog.info("x = %s",x)
##D   if (x < 4) stop('stop') else x
##D }
##D ntry(fn, 6)
## End(Not run)



