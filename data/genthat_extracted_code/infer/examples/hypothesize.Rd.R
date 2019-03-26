library(infer)


### Name: hypothesize
### Title: Declare a null hypothesis
### Aliases: hypothesize

### ** Examples

# Permutation test similar to ANOVA
mtcars %>%
  dplyr::mutate(cyl = factor(cyl)) %>%
  specify(mpg ~ cyl) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 100, type = "permute") %>%
  calculate(stat = "F")




