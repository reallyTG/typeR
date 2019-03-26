library(vctrs)


### Name: vec_match
### Title: Find matching observations across vectors
### Aliases: vec_match vec_in

### ** Examples

hadley <- strsplit("hadley", "")[[1]]
vec_match(hadley, letters)

vowels <- c("a", "e", "i", "o", "u")
vec_match(hadley, vowels)
vec_in(hadley, vowels)

# Only the first index of duplicates is returned
vec_match(c("a", "b"), c("a", "b", "a", "b"))



