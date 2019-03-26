library(assertive.data.us)


### Name: assert_all_are_us_telephone_numbers
### Title: Is the string a valid US telephone number?
### Aliases: assert_all_are_us_telephone_numbers
###   assert_any_are_us_telephone_numbers is_us_telephone_number

### ** Examples

phone_numbers <- c(
  "12345678901",   #country code as 1 
  "+12345678901",  #country code as +1
  "0012345678901", #country code as 001
  "2345678901",    #no country code
  "10345678901",   #NPA can't begin 0 
  "11345678901",   #...or 1
  "12335678901",   #2nd, 3rd digits of NPA can't match
  "12340678901",   #NXX can't begin 0        
  "12341678901",   #...or 1
  "12345118901",   #2nd, 3rd digits of NXX can't be 11
  "1234567",       #NPA must be included               
  "12345678"      #ditto
)
is_us_telephone_number(phone_numbers)



