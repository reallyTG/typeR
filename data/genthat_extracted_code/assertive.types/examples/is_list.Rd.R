library(assertive.types)


### Name: assert_is_list
### Title: Is the input a list?
### Aliases: assert_is_list assert_is_pairlist is_list is_pairlist

### ** Examples

assert_is_list(list(1,2,3))
assert_is_pairlist(.Options)
#These examples should fail.
assertive.base::dont_stop({
  assert_is_list(1:10)
  assert_is_pairlist(options())
})



