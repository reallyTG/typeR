library(assertive.data)


### Name: assert_all_are_hex_colors
### Title: Does the character vector contain hex colors?
### Aliases: assert_all_are_hex_colors assert_any_are_hex_colors
###   assert_all_are_hex_colours assert_any_are_hex_colours is_hex_color
###   is_hex_colour

### ** Examples

x <- c(
  "#012345", "#789abc", "#defDEF",  #ok
  "012345",                         #no hash
  "#g12345",                        #bad letter
  "#01 23 45",                      #contains spaces
  "#12345", "#1234567"              #wrong length
)
is_hex_color(x)
assert_any_are_hex_colors(x)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_hex_colors(x))



