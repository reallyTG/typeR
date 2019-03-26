library(sets)


### Name: canonicalize set and mapping
### Title: Canonicalize set and mapping
### Aliases: canonicalize_set_and_mapping
### Keywords: math

### ** Examples

L <- list(c, "a", 3)
M1 <- list("a","b","c")
M2 <- matrix(1:9, ncol = 3)
canonicalize_set_and_mapping(L, M1)
canonicalize_set_and_mapping(L, M2)
canonicalize_set_and_mapping(L, M2, 1)



