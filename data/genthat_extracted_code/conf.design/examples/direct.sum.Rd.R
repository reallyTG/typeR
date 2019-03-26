library(conf.design)


### Name: direct.sum
### Title: Form the direct sum of designs.
### Aliases: direct.sum
### Keywords: design

### ** Examples

### Generate a half replicate of a 2^3 x 3^2 experiment.  The factors are
### to be A, B, C, D, E.  The fractional relation is to be I = ABC and the
### DE effect is to be confounded with blocks.

### First construct the 2^3 design, confounded in two blocks:
d1 <- conf.design(cbind(A = 1, B = 1, C = 1), p = 2)

### Next the 3^2 design, with DE partially confounded in blocks:
d2 <- conf.design(cbind(D = 1, E = 1), p = 3)

### Now extract the principal block from the 2^3 design and form the direct
### sum withthe 3^2 design
dsn <- direct.sum(subset(d1, Blocks == "0"), d2)

### combine block factors into one
dsn <- within(dsn, {
  Blocks <- join(Blocks, Blocksa)
  Blocksa <- NULL
})
head(dsn)



