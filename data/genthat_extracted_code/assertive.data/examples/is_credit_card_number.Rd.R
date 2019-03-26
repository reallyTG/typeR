library(assertive.data)


### Name: assert_all_are_credit_card_numbers
### Title: Does the character vector contain credit card numbers?
### Aliases: assert_all_are_credit_card_numbers
###   assert_any_are_credit_card_numbers is_credit_card_number

### ** Examples

x <- c(
  #visa
  "4111 1111 1111 1111",    #spaces are allowed where they 
                            #would occur on the card
  "4012888888881881",       #though they can be omitted
  "4111 1111 1111 11111",   #too many digits
  "4012888888881882",       #bad check digit
  #mastercard
  "5555 5555 5555 4444",
  "5105 1051 0510 5100",
  "5655 5555 5555 4443",    #starts 56
  "51051 051 0510 5100",    #bad spacing
  #amex
  "3782 822463 10005",
  "3714 496353 98431",
  "3787 344936 71000", 
  "3782 822463 1005",       #not enough digits
  #diners
  "3056 930902 5904",
  "3852 000002 3237",
  #discover
  "6011 1111 1111 1117",
  "6011 0009 9013 9424",
  #jcb
  "3530 1113 3330 0000",
  "3566 0020 2036 0505"
)
is_credit_card_number(x)
assert_any_are_credit_card_numbers(x)
assertive.base::dont_stop(assert_all_are_credit_card_numbers(x))



