library(profr)


### Name: parse_rprof
### Title: Parse Rprof output.
### Aliases: parse_rprof
### Keywords: debugging

### ** Examples

nesting_ex <- system.file("samples", "nesting.rprof", package="profr")
nesting <- parse_rprof(nesting_ex)

reshape_ex <- system.file("samples", "reshape.rprof", package="profr")
diamonds <- parse_rprof(reshape_ex)



