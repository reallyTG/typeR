library(rmonad)


### Name: crunch
### Title: Cache all large values that are stored in memory
### Aliases: crunch

### ** Examples

## Not run: 
##D set.seed(42)
##D m <- as_monad(runif(1e6), tag="a") %>>%
##D      sqrt %>% tag("b") %>>%
##D      log %>% tag("c") %>>% prod(2) %>>% prod(3)
##D m1 <- crunch(m)
##D get_value(m,  1:3) %>% lapply(head)
##D get_value(m1, 1:3) %>% lapply(head)
## End(Not run)



