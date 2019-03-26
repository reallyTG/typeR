library(assertive.strings)


### Name: assert_all_are_matching_fixed
### Title: Does the string match a pattern?
### Aliases: assert_all_are_matching_fixed assert_all_are_matching_regex
###   assert_all_are_not_matching_fixed assert_all_are_not_matching_regex
###   assert_any_are_matching_fixed assert_any_are_matching_regex
###   assert_any_are_not_matching_fixed assert_any_are_not_matching_regex
###   is_matching_fixed is_matching_regex is_not_matching_fixed
###   is_not_matching_regex

### ** Examples

# Is it safe to eat oysters?
is_matching_fixed(month.name, "r")

# Sometimes it is easier to specify the negative match.
is_matching_regex(LETTERS, "[^AEIOU]")
is_not_matching_regex(LETTERS, "[AEIOU]")

# Matching is vectorized over both x and pattern
(pi_digits <- strsplit(format(pi, digits = 17), "")[[1]])
is_matching_regex(pi_digits, c("[13]", "[59]"))

assert_any_are_matching_regex(pi_digits, c("[13]", "[59]"))

# These checks should fail
assertive.base::dont_stop({
  assert_all_are_matching_regex(pi_digits, c("[13]", "[59]"))
})



