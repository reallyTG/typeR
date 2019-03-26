library(infer)


### Name: generate
### Title: Generate resamples, permutations, or simulations
### Aliases: generate GENERATION_TYPES
### Keywords: datasets

### ** Examples

# Permutation test for two binary variables
mtcars %>%
  dplyr::mutate(am = factor(am), vs = factor(vs)) %>%
  specify(am ~ vs, success = "1") %>%
  hypothesize(null = "independence") %>%
  generate(reps = 100, type = "permute")




