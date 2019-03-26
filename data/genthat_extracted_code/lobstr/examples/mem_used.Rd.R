library(lobstr)


### Name: mem_used
### Title: How much memory is currently used by R?
### Aliases: mem_used

### ** Examples

prev_m <- 0; m <- mem_used(); m - prev_m

x <- 1:1e6
prev_m <- m; m <- mem_used(); m - prev_m
obj_size(x)

rm(x)
prev_m <- m; m <- mem_used(); m - prev_m

prev_m <- m; m <- mem_used(); m - prev_m



