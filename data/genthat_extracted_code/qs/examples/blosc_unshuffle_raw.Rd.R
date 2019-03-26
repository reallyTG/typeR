library(qs)


### Name: blosc_unshuffle_raw
### Title: Un-shuffle a raw vector
### Aliases: blosc_unshuffle_raw

### ** Examples

x <- serialize(1L:1000L, NULL)
xshuf <- blosc_shuffle_raw(x, 4)
xunshuf <- blosc_unshuffle_raw(xshuf, 4)



