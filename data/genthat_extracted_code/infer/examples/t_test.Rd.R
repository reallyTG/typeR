library(infer)


### Name: t_test
### Title: Tidy t-test
### Aliases: t_test

### ** Examples

# t test for comparing mpg against automatic/manual
mtcars %>%
  dplyr::mutate(am = factor(am)) %>%
  t_test(mpg ~ am, order = c("1", "0"), alternative = "less")




