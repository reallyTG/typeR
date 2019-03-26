library(bitops)


### Name: cksum
### Title: Compute Check Sum
### Aliases: cksum
### Keywords: arith utilities

### ** Examples

   b <- "I would rather have a bottle in front of me than frontal lobotomy\n"
 stopifnot(cksum(b) == 1342168430)
 (bv <- strsplit(b, " ")[[1]])
 cksum(bv) # now a vector of length 13



