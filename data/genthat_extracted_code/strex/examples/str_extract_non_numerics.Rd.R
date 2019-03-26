library(strex)


### Name: str_extract_non_numerics
### Title: Extract non-numbers from a string.
### Aliases: str_extract_non_numerics str_nth_non_numeric
###   str_first_non_numeric str_last_non_numeric

### ** Examples

str_extract_non_numerics("abc123abc456")
str_extract_non_numerics("abc1.23abc456")
str_extract_non_numerics("abc1.23abc456", decimals = TRUE)
str_extract_non_numerics("abc1..23abc456", decimals = TRUE)
str_extract_non_numerics("abc1..23abc456", decimals = TRUE,
                     leading_decimals = TRUE)
str_extract_non_numerics(c("-123abc456", "ab1c"))
str_extract_non_numerics("-123abc456", negs = TRUE)
str_extract_non_numerics("--123abc456", negs = TRUE)
str_extract_non_numerics("--123abc456", negs = TRUE)
str_nth_non_numeric("--123abc456", 1)
str_nth_non_numeric("--123abc456", -2)




