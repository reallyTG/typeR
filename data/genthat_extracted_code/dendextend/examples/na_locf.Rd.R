library(dendextend)


### Name: na_locf
### Title: Last Observation Carried Forward
### Aliases: na_locf

### ** Examples

na_locf(c(NA, NA))
na_locf(c(1, NA))
na_locf(c(1, NA, NA, NA))
na_locf(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4))
na_locf(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4), recursive = FALSE)

## Not run: 
##D 
##D library(microbenchmark)
##D library(zoo)
##D 
##D microbenchmark(
##D    na_locf = na_locf(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4)),
##D    na.locf = na.locf(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4))
##D ) # my implementation is 6 times faster :)
##D 
##D microbenchmark(
##D    na_locf = na_locf(rep(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4), 1000)),
##D    na.locf = na.locf(rep(c(1, NA, NA, NA, 2, 2, NA, 3, NA, 4), 1000))
##D ) # my implementation is 3 times faster 
##D 
## End(Not run)





