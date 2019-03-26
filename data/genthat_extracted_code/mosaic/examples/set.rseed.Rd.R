library(mosaic)


### Name: set.rseed
### Title: Set seed in parallel compatible way
### Aliases: set.rseed

### ** Examples

# These should give identical results, even if the `parallel' package is loaded.
set.rseed(123); do(3) * resample(1:10, 2)
set.rseed(123); do(3) * resample(1:10, 2)



