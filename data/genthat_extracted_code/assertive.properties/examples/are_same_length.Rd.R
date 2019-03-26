library(assertive.properties)


### Name: are_same_length
### Title: Are the inputs the same length/dimension?
### Aliases: are_same_length are_same_length_legacy
###   assert_all_are_same_length assert_all_are_same_length_legacy
###   assert_any_are_same_length assert_any_are_same_length_legacy
###   assert_are_same_length assert_have_same_dims have_same_dims

### ** Examples

are_same_length(runif(5), list(1, 2:3, 4:6, 7:10, 11:15))
assertive.base::dont_stop(
  assert_are_same_length(runif(6), list(1, 2:3, 4:6, 7:10, 11:15))
)
have_same_dims(
  matrix(1:12, nrow = 4), 
  data.frame(x = 1:4, y = 5:8, y = 9:12)
)
have_same_dims(1:5, matrix(1:5))



