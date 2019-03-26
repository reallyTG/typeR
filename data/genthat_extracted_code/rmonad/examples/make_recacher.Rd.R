library(rmonad)


### Name: make_recacher
### Title: Make a function that takes an Rmonad and recaches it
### Aliases: make_recacher

### ** Examples

## Not run: 
##D   recacher <- make_recacher(make_local_cacher())
##D   m <- iris %>>% summary %>% recacher
##D   # load the data from a local file
##D   .single_value(m)
##D 
##D   recacher <- make_recacher(memory_cache)
##D   m <- iris %>>% summary %>% recacher
##D   # load the data from memory
##D   .single_value(m)
## End(Not run)

add1 <- function(x) x+1
add2 <- function(x) x+2
add3 <- function(x) x+3
cc <- make_recacher(make_local_cacher())
3 %>>% add1 %>% cc %>>% add2 %>>% add3 -> m
m



