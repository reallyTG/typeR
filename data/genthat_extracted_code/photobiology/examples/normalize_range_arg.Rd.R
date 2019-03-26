library(photobiology)


### Name: normalize_range_arg
### Title: Normalize a range argument into a true numeric range
### Aliases: normalize_range_arg

### ** Examples

normalize_range_arg(c(NA, 500), range(sun.spct))
normalize_range_arg(c(300, NA), range(sun.spct))
normalize_range_arg(c(100, 5000), range(sun.spct), FALSE)
normalize_range_arg(c(NA, NA), range(sun.spct))
normalize_range_arg(c(NA, NA), sun.spct)




