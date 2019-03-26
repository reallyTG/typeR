library(assertive.data.uk)


### Name: assert_all_are_uk_telephone_numbers
### Title: Is the string a valid UK telephone number?
### Aliases: assert_all_are_uk_telephone_numbers
###   assert_any_are_uk_telephone_numbers is_uk_telephone_number

### ** Examples

phone_nos <- c("+44 207 219 3475", "08457 90 90 90")
is_uk_telephone_number(phone_nos)
assert_all_are_uk_telephone_numbers(phone_nos)



