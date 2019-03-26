library(assertive.data.uk)


### Name: assert_all_are_uk_car_licences
### Title: Is the string a valid UK car licence plate number?
### Aliases: assert_all_are_uk_car_licences assert_any_are_uk_car_licences
###   assert_all_are_uk_car_licenses assert_any_are_uk_car_licenses
###   is_uk_car_licence is_uk_car_license

### ** Examples

licences <- c(
  #1903 to 1931
  "A 1", "AA 9999",                   #ok
  "A 01",                             #zero prefix on number
  "S0", "G0", "RG0", "LM0",           #ok, special plates
  #1931 to 1963
  "AAA 1", "AAA 999",                 #ok
  "III 1", "QQQ 1", "ZZZ 1",          #disallowed letters
  "AAA 01",                           #zero prefix on number
  #1931 to 1963 alt
  "1 AAA", "9999 AAA",                #ok
  "1 III", "1 QQQ", "1 ZZZ",          #disallowed letters
  "01 AAA",                           #zero prefix on number
  #1963 to 1982
  "AAA 1A", "AAA 999A",               #ok
  "AAA 1I", "AAA 1O", "AAA 1Q",       #disallowed letters
  "AAA 1U", "AAA 1Z", 
  "AAA 01A",                          #zero prefix on number
  #1982 to 2001
  "A1 AAA", "A999 AAA",               #ok    
  "I1 AAA", "O1 AAA",                 #disallowed letters
  "U1 AAA", "Z1 AAA",
  "A01 AAA",                          #zero prefix on number
  #2001 to 2051
  "AA00 AAA", "AA99 AAA",             #ok
  "II00 AAA", "QQ00 AAA", "ZZ00 AAA", #disallowed letters
  "AA00 III", "AA00 QQQ"
)
is_uk_car_licence(licences)
assert_any_are_uk_car_licences(licences)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_uk_car_licences(licences))



