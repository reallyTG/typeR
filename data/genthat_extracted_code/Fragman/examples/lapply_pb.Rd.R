library(Fragman)


### Name: lapply_pb
### Title: complementary tools for Fragman
### Aliases: lapply_pb

### ** Examples

l <- sapply(1:200, function(x) list(rnorm(1000)))
lapply_pb(l, mean)



