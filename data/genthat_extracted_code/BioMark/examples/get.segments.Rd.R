library(BioMark)


### Name: get.segments
### Title: Subsampling segments
### Aliases: get.segments
### Keywords: manip iteration

### ** Examples

i1 <- seq(1, 10, by = 2)
i2 <- seq(2, 15, by = 2)
get.segments(i1, i2)
get.segments(i1, i2, max.seg = 10)
get.segments(i1, i2, oob.size = 2, max.seg = 10)

I <- rep(1:2, c(5,6))
get.segments(I)
get.segments(I, max.seg = 15)



