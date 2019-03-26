library(assertive.data)


### Name: assert_all_are_email_addresses
### Title: Does the character vector contain email addresses?
### Aliases: assert_all_are_email_addresses assert_any_are_email_addresses
###   is_email_address

### ** Examples

addresses <- c(
  ok       = "a@b.com", 
  no_at    = "a_at_b.com", 
  no_dot   = "a@bcom", 
  long_tld = "a@b.comma", 
  punct    = "a!$&@b.com", 
  missing  = NA
)
is_email_address(addresses)
is_email_address(addresses, method = "rfc5322")



