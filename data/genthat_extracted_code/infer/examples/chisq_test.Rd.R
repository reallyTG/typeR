library(infer)


### Name: chisq_test
### Title: Tidy chi-squared test
### Aliases: chisq_test

### ** Examples

# chisq test for comparing number of cylinders against automatic/manual
mtcars %>%
  dplyr::mutate(cyl = factor(cyl), am = factor(am)) %>%
  chisq_test(cyl ~ am)




