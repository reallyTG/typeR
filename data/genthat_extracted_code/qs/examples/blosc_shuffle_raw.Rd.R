library(qs)


### Name: blosc_shuffle_raw
### Title: Shuffle a raw vector
### Aliases: blosc_shuffle_raw

### ** Examples

x <- serialize(1L:1000L, NULL)
xshuf <- blosc_shuffle_raw(x, 4)
xunshuf <- blosc_unshuffle_raw(xshuf, 4)



