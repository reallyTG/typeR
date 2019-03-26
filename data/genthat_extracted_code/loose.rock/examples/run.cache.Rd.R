library(loose.rock)


### Name: run.cache
### Title: Run function and save cache
### Aliases: run.cache

### ** Examples

# [optional] save cache in a temporary directory
# otherwise it writes to the current directory
# to folder named run-cache
base.dir(tempdir())
#
run.cache(c, 1, 2, 3, 4)
#
# next three should use the same cache
#  note, the middle call should be a little faster as digest is not calculated
#   for the first argument
run.cache(c, 1, 2, 3, 4)
run.cache(c, 1, 2, 3, 4, cache.digest = list(digest.cache(1)))
run.cache(c, a=1, 2, c= 3, 4)



