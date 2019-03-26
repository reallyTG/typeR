library(ProTrackR)


### Name: unsignedIntToRaw
### Title: Convert unsigned integer into a raw vector
### Aliases: unsignedIntToRaw

### ** Examples

## generate some unsigned integer:
some.integer <- 43251

## convert the unsigned integer into raw data:
unsignedIntToRaw(some.integer, length.out = 4)

## Not run: 
##D ## note that the integer is too large to store as raw with length.out = 1:
##D unsignedIntToRaw(some.raw.data, length.out = 1)
## End(Not run)




