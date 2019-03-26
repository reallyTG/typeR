library(varband)


### Name: varband_gen
### Title: Generate a model with variable bandwidth.
### Aliases: varband_gen

### ** Examples

set.seed(123)
# small block size (big number of blocks)
true_small <- varband_gen(p = 50, block = 10)
# large block size (small number of blocks)
true_large <- varband_gen(p = 50, block = 2)



