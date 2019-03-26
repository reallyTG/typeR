library(assertive.data)


### Name: assert_all_are_cas_numbers
### Title: Does the character vector contain CAS registry numbers?
### Aliases: assert_all_are_cas_numbers assert_any_are_cas_numbers
###   is_cas_number

### ** Examples

x <- c(
  water            = "7732-18-5", 
  d_glucose        = "50-99-7",
  l_glucose        = "921-60-8",
  no_hyphens       = "7732185", 
  two_check_digits = "7732-18-55",
  bad_check_digit  = "7732-18-4",
  missing          = NA
)
is_cas_number(x)
assert_any_are_cas_numbers(x)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_cas_numbers(x))



