library(Bessel)


### Name: bI
### Title: Bessel I() function Simple Series Representation
### Aliases: bI
### Keywords: math

### ** Examples

stopifnot(all.equal(bI     (1:10, 1), # R code
                    besselI(1:10, 1)))# internal C code w/ different algorithm



