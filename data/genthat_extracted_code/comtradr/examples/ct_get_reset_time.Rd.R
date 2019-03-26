library(comtradr)


### Name: ct_get_reset_time
### Title: Comtradr rate limit time check
### Aliases: ct_get_reset_time

### ** Examples

ct_get_reset_time()

# Get minutes remaining until limit reset, as numeric value.
as.double(ct_get_reset_time() - Sys.time())



