library(plot3logit)


### Name: get_vdelta
### Title: It computes the vector of covariate change
### Aliases: get_vdelta
### Keywords: internal

### ** Examples

library(magrittr)

# Example 1
matrix(c(0.11, 0.07, -0.1, 0.09), 2) %>%
  plot3logit:::read_model('logit', NULL) %>%
  plot3logit:::get_vdelta(c(0, 1), .)

# Example 2
library(nnet)
data(cross_1year)
mod0 <- multinom(employment_sit ~ ., cross_1year)
plot3logit:::read_model(mod0, 'logit', NULL) %>%
  plot3logit:::get_vdelta('genderFemale', .)

# Example 3
plot3logit:::read_model(mod0, 'logit', NULL) %>%
  plot3logit:::get_vdelta('-0.5 * genderFemale + hsscore', .)




