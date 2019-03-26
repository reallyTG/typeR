library(bit)


### Name: rlepack
### Title: Hybrid Index, rle-pack utilities
### Aliases: rlepack rlepack.integer rleunpack rleunpack.rlepack
###   rev.rlepack unique.rlepack anyDuplicated.rlepack
### Keywords: IO data

### ** Examples

  x <- rlepack(rep(0L, 10))
## Don't show: 
 for (x in list(10:1, 1:10, c(10:1,1:10), c(1:10,10:1), sample(100), sample(100, 100, TRUE), sample(10, 100, TRUE))){
   stopifnot(identical(rleunpack(rlepack(x)), x))
   stopifnot(identical(rleunpack(unique(rlepack(x))), unique(x)))
   stopifnot(identical(anyDuplicated(rlepack(x)), anyDuplicated(x)))
 }
## End(Don't show)



