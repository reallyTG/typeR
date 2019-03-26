library(stringr)


### Name: str_order
### Title: Order or sort a character vector.
### Aliases: str_order str_sort

### ** Examples

str_order(letters)
str_sort(letters)

str_order(letters, locale = "haw")
str_sort(letters, locale = "haw")

x <- c("100a10", "100a5", "2b", "2a")
str_sort(x)
str_sort(x, numeric = TRUE)



