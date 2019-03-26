library(strex)


### Name: str_extract_numbers
### Title: Extract numbers from a string.
### Aliases: str_extract_numbers str_nth_number str_first_number
###   str_last_number

### ** Examples

str_extract_numbers(c("abc123abc456", "abc1.23abc456"))
str_extract_numbers(c("abc1.23abc456", "abc1..23abc456"), decimals = TRUE)
str_extract_numbers("abc1..23abc456", decimals = TRUE)
str_extract_numbers("abc1..23abc456", decimals = TRUE, leading_decimals = TRUE)
str_extract_numbers("abc1..23abc456", decimals = TRUE, leading_decimals = TRUE,
                leave_as_string = TRUE)
str_extract_numbers("-123abc456")
str_extract_numbers("-123abc456", negs = TRUE)
str_extract_numbers("--123abc456", negs = TRUE)
str_extract_numbers(c(rep("abc1.2.3", 2), "a1b2.2.3", "e5r6"), decimals = TRUE)
str_extract_numbers("ab.1.2", decimals = TRUE, leading_decimals = TRUE)
str_nth_number("abc1.23abc456", 2:3)
str_nth_number("abc1.23abc456", 2, decimals = TRUE)
str_nth_number("-123abc456", -2, negs = TRUE)




