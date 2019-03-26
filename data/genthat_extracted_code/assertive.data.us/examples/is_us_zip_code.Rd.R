library(assertive.data.us)


### Name: assert_all_are_us_zip_codes
### Title: Is the string a valid US zip code?
### Aliases: assert_all_are_us_zip_codes assert_any_are_us_zip_codes
###   is_us_zip_code

### ** Examples

zip_codes <- c(
  "Beverley Hills"  = "90210", 
  "The White House" = "20500", 
  USPTO             = "22313-1450",  #5+4 style ok
  "No hyphen"       = "223131450",
  "Bad area prefix" = "09901",    
  Missing           = NA
 )
is_us_zip_code(zip_codes)
assert_any_are_us_zip_codes(zip_codes)
#The following code should throw an error.
assertive.base::dont_stop(assert_all_are_us_zip_codes(zip_codes))



