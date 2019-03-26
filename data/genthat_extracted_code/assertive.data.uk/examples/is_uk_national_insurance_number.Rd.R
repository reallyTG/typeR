library(assertive.data.uk)


### Name: assert_all_are_uk_national_insurance_numbers
### Title: Is the string a valid UK national insurance number?
### Aliases: assert_all_are_uk_national_insurance_numbers
###   assert_any_are_uk_national_insurance_numbers
###   is_uk_national_insurance_number

### ** Examples

ni_numbers <- c(
  "AA 00 00 00 A", "AA 00 00 00", "AA000000A",                #ok
  "ZZ 99 99 99 M", "ZZ 99 99 99", "ZZ999999M",                
  "DA 00 00 00", "FA 00 00 00", "IA 00 00 00",                #bad first letter
  "QA 00 00 00", "UA 00 00 00", "VA 00 00 00",
  "AD 00 00 00", "AF 00 00 00", "AI 00 00 00", "AO 00 00 00", #bad second letter
  "AQ 00 00 00", "AU 00 00 00", "AV 00 00 00",
  "AA 00 00 00 E", "AA 00 00 00 G", "AA 00 00 00 H",          #bad final letter
  "AA 00 00 00 I", "AA 00 00 00 J", "AA 00 00 00 K",
  "AA 00 00 00 L", "AA 00 00 00 N", "AA 00 00 00 O",
  "AA 00 00 00 P", "AA 00 00 00 Q", "AA 00 00 00 R",
  "AA 00 00 00 S", "AA 00 00 00 T", "AA 00 00 00 U",
  "AA 00 00 00 V", "AA 00 00 00 W", "AA 00 00 00 X",
  "AA 00 00 00 Y", "AA 00 00 00 Z"    
)
is_uk_national_insurance_number(ni_numbers)
assert_any_are_uk_national_insurance_numbers(ni_numbers)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_uk_national_insurance_numbers(ni_numbers))



