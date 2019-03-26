library(assertive.data)


### Name: assert_all_are_ip_addresses
### Title: Does the character vector contain IP addresses?
### Aliases: assert_all_are_ip_addresses assert_any_are_ip_addresses
###   is_ip_address

### ** Examples

x <- c(
  localhost     = "localhost", 
  valid_address = "255.0.255.0", 
  out_of_range  = "1.2.3.256",
  five_blocks   = "1.2.3.4.5",
  non_numeric   = "1.2.3.Z",
  missing_block = "1.2.3.NA",
  missing       = NA
)
is_ip_address(x)
assert_any_are_ip_addresses(x)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_ip_addresses(x))



