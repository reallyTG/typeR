library(assertive.data.uk)


### Name: assert_all_are_uk_postcodes
### Title: Is the string a valid UK postcode?
### Aliases: assert_all_are_uk_postcodes assert_any_are_uk_postcodes
###   is_uk_postcode

### ** Examples

postcodes <- c(
  "SW1A 1AA", "SK11 9DW", "M34FP", "Le45ns", "TS25 2BZ", "gir 0aa"
)
is_uk_postcode(postcodes)
assert_all_are_uk_postcodes(postcodes)



