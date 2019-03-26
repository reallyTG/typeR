library(memoise)


### Name: has_cache
### Title: Test whether a memoised function has been cached for particular
###   arguments.
### Aliases: has_cache

### ** Examples

mem_sum <- memoise(sum)
has_cache(mem_sum)(1, 2, 3) # FALSE
mem_sum(1, 2, 3)
has_cache(mem_sum)(1, 2, 3) # TRUE



