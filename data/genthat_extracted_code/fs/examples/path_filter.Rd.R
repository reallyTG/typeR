library(fs)


### Name: path_filter
### Title: Filter paths
### Aliases: path_filter

### ** Examples

path_filter(c("foo", "boo", "bar"), glob = "*oo")
path_filter(c("foo", "boo", "bar"), glob = "*oo", invert = TRUE)

path_filter(c("foo", "boo", "bar"), regexp = "b.r")



